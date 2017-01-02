# Sets up the VACM configuration for auth access.
# @see smpd.conf(5) for more details.
#
# @param types
# @param group
# @param view
# @param model
# @param level
# @param context
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::authaccess (
  String           $types,
  String           $group,
  String           $view,
  Optional[String] $model   = undef,
  Optional[String] $level   = undef,
  Optional[String] $context = undef
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+${name}.autha":
    content => template('snmpd/authaccess.erb')
  }
}
