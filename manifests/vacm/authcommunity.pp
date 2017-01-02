# Sets up the authcommunity piece of the VACM Configuration.
# @see snmpd.conf(5) for more details.
#
# @param types
# @param community
# @param source
# @param oid
# @param view
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::authcommunity (
  String           $types,
  String           $community,
  Optional[String] $source = undef,
  Optional[String] $oid    = undef,
  Optional[String] $view   = undef
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+${name}.authc":
    content => template('snmpd/authview.erb')
  }
}
