# @see snmpd.conf(5) 'System Load Monitoring' for additional information.
#
# @param max1
# @param max5
# @param max15
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::load (
  $max1,
  $max5 = '',
  $max15 = ''
) {
  simpcat_fragment { 'snmpd+mon.load':
    content => "load ${max1} ${max5} ${max15}\n"
  }
}
