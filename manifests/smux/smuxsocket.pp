# @see snmpd.conf(5) SMUX Sub-Agents for more information.
#
# @param ipv4_address
# @param trusted_nets
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::smux::smuxsocket (
  Simplib::IP::V4  $ipv4_address,
  Boolean          $firewall      = simplib::lookup('simp_options::firewall', { 'default_value' => false, 'value_type' => Boolean }),
  Simplib::Netlist $trusted_nets  = simplib::lookup('simp_options::trusted_nets', { 'default_value' => ['127.0.0.1', '::1'], 'value_type' => Array[String] })
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+socket.${name}.smux":
    content => "smuxsocket ${ipv4_address}\n"
  }

  if $firewall {
    include '::iptables'
    iptables::listen::tcp_stateful { "smux_${name}":
      trusted_nets => $trusted_nets,
      dports       => 199
    }
  }
}
