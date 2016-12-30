# @see snmpd.conf(5) SMUX Sub-Agents for more information.
#
# @param oid
# @param pass
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::smux::smuxpeer (
  $oid,
  $pass
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+peer.${name}.smux":
    content => "smuxpeer ${oid} ${pass}\n"
  }
}
