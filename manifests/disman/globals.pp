# Configure the global DisMan Event MIB options.
#
# @see snmpd.conf(5) 'DisMan Event MIB' for additional information.
#
# @param iquery_sec_name
# @param agent_sec_name
# @param strict_disman
# @param link_up_down_notifications
# @param default_monitors
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::disman::globals (
  $iquery_sec_name = '',
  $agent_sec_name = '',
  $strict_disman = false,
  $link_up_down_notifications = '',
  $default_monitors = ''
) {
  simpcat_fragment { 'snmpd+disman.globals':
    content => template('snmpd/disman_globals.erb')
  }

  validate_bool($strict_disman)
}
