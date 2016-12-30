# @see the 'Proxy Support' section of snmpd.conf(5) for details.
#
# @param host
# @param oid
# @param context_name
# @param snmpcmd_args
# @param remote_oid
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::proxy (
  $host,
  $oid,
  $context_name = '',
  $snmpcmd_args = '',
  $remote_oid = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.proxy":
    content => template('snmpd/proxy.erb')
  }
}
