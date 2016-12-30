# This define sets up the 'file' option of the Log File Monitoring section of
# snmpd.conf.
#
# @see snmpd.conf(5) 'Log File Monitoring' for more information.
#
# @param name
#   Becomes part of the temp file path. Do not make '/' part of $name!
#
# @param file_path
# @param max_size
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::monitor_log_file (
  $file_path,
  $max_size = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.logmon":
    content => "file ${file_path} ${max_size}\n"
  }
}
