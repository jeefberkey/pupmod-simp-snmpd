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
  Integer           $agentx_ping_interval,
  Optional[Integer] $agentx_timeout = undef,
  Optional[Integer] $agentx_retries = undef
) {

  simpcat_fragment { 'snmpd+sub.global.agentX':
    content => template('snmpd/agentX.erb')
  }
}
