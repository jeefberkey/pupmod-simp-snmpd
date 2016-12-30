# Configure the main segment of the AgentX sub-agents.
#
# @see snmpd.conf(5) AgentX Sub-Agents for more information.
#
# @param enable
# @param agentx_timeout
# @param entx_retries
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::agentx::master::conf (
  $enable = true,
  $agentx_timeout = '',
  $agentx_retries = ''
) {
  simpcat_fragment { 'snmpd+master.global.agentX':
    content => template('snmpd/agentX.erb')
  }

  validate_bool($enable)
  if !empty($agentx_timeout) {
    validate_integer($agentx_timeout)
  }
  if !empty($agentx_retries) {
    validate_integer($agentx_retries)
  }
}
