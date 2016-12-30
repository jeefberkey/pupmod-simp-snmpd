# Create the AgentX subagent.
#
# @see snmpd.conf(5) AgentX Sub-Agents for additional information.
#
# @param agentx_ping_interval
# @param agentx_timeout
# @param agentx_retries
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::agentx::sub::conf (
  $agentx_ping_interval,
  $agentx_timeout = '',
  $agentx_retries = ''
) {
  simpcat_fragment { 'snmpd+sub.global.agentX':
    content => template('snmpd/agentX.erb')
  }

  if !empty($agentx_timeout) {
    validate_integer($agentx_timeout)
  }
  if !empty($agentx_retries) {
    validate_integer($agentx_retries)
  }
}
