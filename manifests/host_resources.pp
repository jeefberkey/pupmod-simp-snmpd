# @see snmpd.conf(5) 'Host Resources Group' for additional information.
#
# @param ignore_disk
# @param skip_nfs_in_host_resources
# @param storage_use_nfs
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::host_resources (
  $ignore_disk = '',
  $skip_nfs_in_host_resources = '',
  $storage_use_nfs = ''
) {
  simpcat_fragment { 'snmpd+info.host_resources':
    content => template('snmpd/host_resources.erb')
  }
}
