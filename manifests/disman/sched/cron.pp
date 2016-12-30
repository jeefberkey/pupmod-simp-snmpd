# Schedule a periodic SET assignment.
#
# @see "DisMan Schedule MIB" in the snmpd.conf(5) man page for additional
# information.
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
define snmpd::disman::sched::cron (
  $oid,
  $value,
  $minute = '*',
  $hour = '*',
  $day = '*',
  $month = '*',
  $weekday = '*'
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+disman.${name}.cron":
    content => "cron ${minute} ${hour} ${day} ${month} ${weekday} ${oid} = ${value}\n"
  }
}
