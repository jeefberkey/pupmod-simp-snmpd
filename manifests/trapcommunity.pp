# @see the 'Notification Handling' section of snmpd.conf(5) for details.
#
# @param name
#     Becomes the community string
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::trapcommunity {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.comstr":
    content => "trapcommunity ${name}\n"
  }
}
