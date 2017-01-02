# Configure process monitoring.
#
# @see snmpd.conf(5) 'Process Monitoring' for more information on this class.
# In all defines $name is mapped to NAME from the man page.
#
# @param prog
# @param args
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::procmon::procfix (
  String $prog,
  String $args
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+${name}.procfix":
    content => "procfix ${name} ${prog} ${args}\n"
  }
}
