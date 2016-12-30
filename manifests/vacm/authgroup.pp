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
  $types,
  $group,
  $model = '',
  $level = '',
  $oid = '',
  $view = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.authg":
    content => template('snmpd/authview.erb')
  }

  if !empty($level) { validate_array_member($level, ['noauth','priv']) }
}
