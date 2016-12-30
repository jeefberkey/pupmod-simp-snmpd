# A direct equivalent to the original access directive, typically listing the  view  types
# as read or read,write as appropriate. (or see ’snmptrapd.conf(5)’ for other possibilities).
# All other fields have the same interpretation as with access.
#
# @see snmpd.conf(5) for more details.
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::setaccess (
  $group,
  $context,
  $model,
  $level,
  $prefix,
  $view,
  $types
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.autha":
    content => "setaccess ${group} ${context} ${model} ${level} ${prefix} ${view} ${types}\n"
  }
}
