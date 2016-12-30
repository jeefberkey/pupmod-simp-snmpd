# Set system information.
#
# @param sys_location
# @param sys_contact
# @param sys_name
# @param sys_services
# @param sys_descr
# @param sys_object_id
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::sysinfo (
  $sys_location = '',
  $sys_contact = '',
  $sys_name = '',
  $sys_services = '72',
  $sys_descr = '',
  $sys_object_id = ''
) {
  simpcat_fragment { 'snmpd+info.system':
    content => template('snmpd/sysinfo.erb')
  }

  validate_integer($sys_services)
}
