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
  Boolean           $enable         = true,
  Optional[Integer] $agentx_timeout = undef,
  Optional[Integer] $agentx_retries = undef
) {

  simpcat_fragment { 'snmpd+master.global.agentX':
    content => template('snmpd/agentX.erb')
  }
}
