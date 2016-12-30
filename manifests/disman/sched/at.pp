# Schedule a one-time SET assignment.
#
# @see "DisMan Schedule MIB" in the snmpd.conf(5) man page for additional
# information.
#
# @param name
#   This becomes part of the temporary file name. Do not put a '/' in the $name!
#
# @param oid
# @param value
# @param minute
# @param hour
# @param day
# @param month
# @param weekday
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::disman::sched::at (
  $oid,
  $value,
  $minute = '*',
  $hour = '*',
  $day = '*',
  $month = '*',
  $weekday = '*'
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+disman.${name}.at":
    content => "at ${minute} ${hour} ${day} ${month} ${weekday} ${oid} = ${value}\n"
  }
}
