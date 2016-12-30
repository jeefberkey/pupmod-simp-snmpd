# Set up the AgentX Sub-Agent permissions.
#
# @see snmpd.conf(5) AgentX Sub-Agents for more information.
#
# @param sockperms
# @param dirperms
# @param user
# @param group
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::agentx::master::perms (
  $sockperms,
  $dirperms = '',
  $user = '',
  $group = ''
) {

  simpcat_fragment { 'snmpd+perms.agentX':
    content => template('snmpd/agentX_perms.erb')
  }
}
