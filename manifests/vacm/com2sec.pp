# Maps an SNMPv1 or SNMPv2c community string to a security name -  either  from  a  particular
# range  of  source  addresses, or globally ("default").  A restricted source can either be a
# specific  hostname  (or  address),  or  a   subnet   -   represented   as   IP/MASK   (e.g.
# 10.10.10.0/255.255.255.0), or IP/BITS (e.g. 10.10.10.0/24), or the IPv6 equivalents
#
# @see snmpd.conf(5) for more details.
#
# @note This is only used for SNMPv1 or SNMPv2
# @note Set $ipv6 to true to enable com2sec6
# @note Set $sockpath to enable com2secunix
# @note $sockpath overrides $ipv6
#
# @param secname
# @param community
# @param context
# @param source
# @param ipv6
# @param sockpath
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::com2sec (
  String           $secname,
  String           $community,
  Optional[String] $context  = undef,
  String           $source   = 'default',
  Boolean          $ipv6     = false,
  Optional[String] $sockpath = undef
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+${name}.com2sec":
    content => template('snmpd/com2sec.erb')
  }
}
