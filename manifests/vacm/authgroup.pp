# Sets up the authgroup piece of the VACM Configuration.
# @see snmpd.conf(5) for more details.
#
# @param types
# @param group
# @param model
# @param level
# @param oid
# @param view
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::authgroup (
  String           $types,
  String           $group,
  Optional[String] $model  = undef,
  Optional[String] $oid    = undef,
  Optional[String] $view   = undef,
  Optional[Enum['noauth','priv']] $level = undef
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+${name}.authg":
    content => template('snmpd/authview.erb')
  }
}
