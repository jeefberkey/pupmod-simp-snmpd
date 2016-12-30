# See the 'Notification Handling' section of snmpd.conf(5) for details.
#
# @param name
#     Becomes HOST from the man page.
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::v1trapaddress {
  include 'snmpd'

  simpcat_fragment { 'snmpd+all.v1trapaddress':
    content => "v1trapaddress ${name}\n"
  }
}
