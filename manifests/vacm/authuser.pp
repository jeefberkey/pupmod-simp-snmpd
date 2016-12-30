# Sets up the authuser piece of the VAMC Configuration.
# @see snmpd.conf(5) for more details.
#
# @param types
# @param user
# @param model
# @param level
# @param oid
# @param view
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::authuser (
  $types,
  $user,
  $model = '',
  $level = '',
  $oid = '',
  $view = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.authu":
    content => template('snmpd/authview.erb')
  }
}
