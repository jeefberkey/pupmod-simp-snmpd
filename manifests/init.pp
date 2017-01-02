# Configure the SNMP Daemon.
#
# This class, and the associated defines, should provide relatively
# comprehensive coverage of the snmpd features.
#
# @see snmpd(8) and snmpd.conf(5) for additional details.
#
# @param rsync_server
# @param rsync_timeout
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd (
  String           $rsync_source                   = "snmp_${::environment}/dlmod",
  Simplib::Host    $rsync_server                   = simplib::lookup('simp_options::rsync::server',  { 'default_value' => '127.0.0.1' }),
  Integer          $rsync_timeout                  = simplib::lookup('simp_options::rsync::timeout', { 'default_value' => 2 }),
  String           $agentgid                       = '333',
  String           $agentuid                       = '333',
  Enum['yes','no'] $leave_pidfile                  = 'no',
  Integer          $max_get_bulk_repeats           = 1024,
  Integer          $max_get_bulk_responses         = 100,
  Optional[String] $engine_id                      = undef,
  Optional[String] $engine_id_type                 = undef,
  Optional[String] $engine_id_nic                  = undef,
  Boolean          $tcpwrappers                    = simplib::lookup('simp_options::tcpwrappers', { 'default_value' => false, 'value_type' => Boolean }),
  Boolean          $dont_log_tcp_wrappers_connects = false
){
  include '::rsync'
  include '::snmpd::utils'

  $l_fragdir = simpcat_fragmentdir('snmpd')
  $l_outdir = simpcat_output('snmpd')

  simpcat_build { 'snmpd':
    target => '/etc/snmp/snmpd.conf',
    order  => [
        '*.all',
        'main.conf',
        '*.auth',
        '*.comm',
        '*.com2sec',
        '*.group',
        '*.view',
        '*.tview',
        '*.access',
        '*.authc',
        '*.authu',
        '*.authg',
        '*.autha',
        '*.seta',
        '*.system',
        '*.iface',
        '*.host_resources',
        '*.proc',
        '*.procfix',
        '*.disks',
        '*.load',
        '*.logmon',
        '*.logmatch',
        '*.comstr',
        '*.sink',
        '*.trapsess',
        'all.authtrapenable',
        'all.v1trapaddress',
        'disman.*',
        'ext.*',
        '*.module',
        '*.proxy',
        '*.smux',
        '*.agentX',
        '*.other',
        '*.inject',
        '*.user' ],
    notify => File['/etc/snmp/snmpd.conf']
  }

  simpcat_build { 'snmpd_agentaddress':
    clean_whitespace => 'all',
    target           => "${l_fragdir}/agentaddress.all",
    parent_build     => 'snmpd',
    file_delimiter   => ',',
    quiet            => true
  }

  file { '/etc/snmp/snmpd.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => [ Service['snmpd'], Exec['set_snmp_perms'] ],
    audit   => content,
    require => [
      Package['net-snmp'],
      Package['net-snmp-libs']
    ]
  }

  file { '/etc/snmp/snmpd.local.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    notify  => [ Service['snmpd'], Exec['set_snmp_perms'] ],
    require => [
      Package['net-snmp'],
      Package['net-snmp-libs']
    ]
  }

  package { [
      'net-snmp',
      'net-snmp-libs',
    ]:
      ensure => 'latest'
  }

  # This pulls any global dynamically loadable modules for later inclusion in
  # the configuration file.
  #
  # If this does not succeed, then the entire build chain will fail.
  rsync { 'snmp_dlmod':
    source       => $rsync_source,
    target       => '/usr/local/share/snmp',
    server       => $rsync_server,
    timeout      => $rsync_timeout,
    delete       => true,
    preserve_acl => false,
    notify       => [
      Service['snmpd'],
      Exec['set_snmp_perms']
    ]
  }

  service { 'snmpd':
    ensure    => 'running',
    enable    => true,
    start     =>
      'process=`/bin/ps -C snmpd > /dev/null; /bin/echo $?`; if [ $process -eq 0 ]; then /sbin/service snmpd reload; else /sbin/service snmpd start; fi',
    restart   =>
      '/sbin/service snmpd stop; /bin/sed -i /usmUser/d /var/net-snmp/snmpd.conf; /sbin/service snmpd start',
    subscribe => File['/etc/snmp/snmpd.conf'],
    require   => [
      Package['net-snmp'],
      Package['net-snmp-libs']
    ]
  }

  if $tcpwrappers {
    include '::tcpwrappers'
    tcpwrappers::allow { 'snmpd':
      pattern => 'ALL'
    }
  }

  simpcat_fragment { 'snmpd+main.conf':
    content => template('snmpd/main.conf.erb')
  }

  if !$agentgid {
    group { 'snmp':
      ensure    => 'present',
      gid       => $agentgid,
      allowdupe => false,
      notify    => Service['snmpd']
    }
  }

  if !$agentuid {
    user { 'snmp':
      ensure     => 'present',
      uid        => $agentuid,
      comment    => 'SNMP User',
      gid        => 'snmp',
      home       => '/var/run/snmpd',
      managehome => false,
      shell      => '/sbin/nologin',
      notify     => Service['snmpd']
    }
  }
}
