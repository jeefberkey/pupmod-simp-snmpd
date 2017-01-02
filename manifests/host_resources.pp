# @see snmpd.conf(5) 'Host Resources Group' for additional information.
#
# @param ignore_disk
# @param skip_nfs_in_host_resources
# @param storage_use_nfs
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::host_resources (
  Optional[String]       $ignore_disk                = undef,
  Optional[Boolean]      $skip_nfs_in_host_resources = undef,
  Optional[Integer[1,2]] $storage_use_nfs            = undef
) {
  simpcat_fragment { 'snmpd+info.host_resources':
    content => template('snmpd/host_resources.erb')
  }
}
