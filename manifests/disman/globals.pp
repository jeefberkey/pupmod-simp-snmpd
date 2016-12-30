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
  Optional[String] $iquery_sec_name            = undef,
  Optional[String] $agent_sec_name             = undef,
  Optional[String] $link_up_down_notifications = undef,
  Optional[String] $default_monitors           = undef,
  Boolean          $strict_disman              = false
) {

  simpcat_fragment { 'snmpd+disman.globals':
    content => template('snmpd/disman_globals.erb')
  }
}
