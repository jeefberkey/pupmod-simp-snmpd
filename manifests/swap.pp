# Monitor the amount of swap space available on the sysetm.
#
# @see the 'System Load Monitoring' section of snmpd.conf(5) for details.
#
# @param min
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::swap (
  $min
) {
  simpcat_fragment { 'snmpd+swap.load':
    content => "swap ${min}\n"
  }

  validate_integer($min)
}
