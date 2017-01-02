# Add an agent address and the associated iptables accesses.
#
# You need to have previously included iptables somewhere for that portion to
# be active.
#
# @see snmpd.conf(5) - 'AGENT BEHAVIOUR' for details.
#
# If you set addr_type to 'agentX', then this will enable an agentXSocket at
# this transport address.
#
# @param name
#   This becomes part of the temp file path. Do not use '/' in $name.
#
# @param addr_type
# @param transport_specifier
# @param transport_address
# @param transport_port
# @param trusted_nets
#   The address range(s) to allow connections from.
#   Follows the syntax accepted by the iptables module.
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::agentaddress (
  String                             $addr_type           = 'agentaddress',
  Enum['udp','tcp','udp6','tcp6']    $transport_specifier = 'udp',
  Variant[Enum['any'],Simplib::Host] $transport_address   = 'any',
  Simplib::Port                      $transport_port      = 161,
  Boolean                            $firewall            = simplib::lookup('simp_options::firewall', { 'default_value' => false }),
  Simplib::Netlist                   $trusted_nets        = simplib::lookup('simp_options::trusted_nets', { 'default_value' => ['127.0.0.1', '::1'] }),
) {
  include '::snmpd'

  simpcat_fragment { "snmpd_agentaddress+${name}.agentaddress":
    content => template('snmpd/agentaddress.erb'),
  }

  if $firewall {
    include '::iptables'
    if $transport_specifier == 'udp' {
      iptables::listen::udp { "snmpd_${name}_udp_listen":
        trusted_nets => $trusted_nets,
        dports       => $transport_port,
        apply_to     => 'ipv4'
      }
    }
    if $transport_specifier == 'tcp' {
      iptables::listen::tcp_stateful { "snmpd_${name}_tcp_listen":
        trusted_nets => $trusted_nets,
        dports       => $transport_port,
        apply_to     => 'ipv4'
      }
    }
    if $transport_specifier == 'udp6' {
      iptables::listen::udp { "snmpd_${name}_udp6_listen":
        trusted_nets => $trusted_nets,
        dports       => $transport_port,
        apply_to     => 'ipv6'
      }
    }
    if $transport_specifier == 'tcp6' {
      iptables::listen::tcp_stateful { "snmpd_${name}_tcp6_listen":
        trusted_nets => $trusted_nets,
        dports       => $transport_port,
        apply_to     => 'ipv6'
      }
    }
  }
}
