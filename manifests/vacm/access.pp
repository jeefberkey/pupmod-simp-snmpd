# Sets up the VACM configuration for auth access.
# @see smpd.conf(5) for more details.
#
# @param sec_model
# @param level
# @param prefix
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::access (
  String $group,
  String $context   = '""',
  Snmpd::Vacm::Access::SecModel $sec_model = 'usm',
  Snmpd::Vacm::Access::Level    $level     = 'priv',
  Snmpd::Vacm::Access::Prefix   $prefix    = 'exact',
  String $read      = 'none',
  String $write     = 'none'
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+${name}.access":
    content => "access ${group} ${context} ${sec_model} ${level} ${prefix} ${read} ${write} none\n"
  }
}
