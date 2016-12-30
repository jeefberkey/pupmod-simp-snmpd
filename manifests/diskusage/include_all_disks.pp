# Set up disk usage monitoring, by percent, for all disks.
#
# @see snmpd.conf(5) 'Disk Usage Monitoring' for additional information.
#
# @param minpercent
#   Do not add the trailing '%' to this variable.
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::diskusage::include_all_disks (
  Integer $minpercent
) {

  simpcat_fragment { 'snmpd+all.disks':
    content => "includeAllDisks ${minpercent}%\n"
  }

}
