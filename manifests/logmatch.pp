# @see the 'Log File Monitoring' section of snmpd.conf(5) for details.
#
# You'll probably want to put your regex in single quotes.
#
# @param name
#   Maps to NAME from the man page.
#
# @param file_path
# @param cycle_time
# @param regex
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::logmatch (
  $file_path,
  $cycle_time,
  $regex
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.logmatch":
    content => "logmatch ${name} ${file_path} ${cycle_time} ${regex}\n"
  }
}
