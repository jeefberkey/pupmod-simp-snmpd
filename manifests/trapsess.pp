# @see the 'Notification Handling' section of snmpd.conf(5) for details.
#
# @param name
#     Becomes HOST in the man page.
# @param snmpcmd_args
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::trapsess (
  $snmpcmd_args = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.trapsess":
    content => "trapsess ${snmpcmd_args} ${name}\n"
  }
}
