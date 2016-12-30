# Set up SNMP Disk Usage Monitoring.
#
# @see snmpd.conf(5) 'Disk Usage Monitoring' for additional information.
#
# @param name
#   Translates to part of the temp file name. Do not add '/' to $name.
#
# @param disk_path
# @param minspace
#   This overrides $minpercent.
#
# @param minpercent
#   Do not add the trailing '%' to this number.
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::diskusage::disk (
  Stdlib::AbsolutePath $disk_path,
  Optional[Integer]    $minspace   = undef,
  Optional[Integer]    $minpercent = undef
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+${name}.disks":
    content => template('snmpd/disk.erb')
  }
}
