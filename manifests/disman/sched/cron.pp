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
  String $oid,
  String $value,
  String $minute  = '*',
  String $hour    = '*',
  String $day     = '*',
  String $month   = '*',
  String $weekday = '*'
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+disman.${name}.cron":
    content => "cron ${minute} ${hour} ${day} ${month} ${weekday} ${oid} = ${value}\n"
  }
}
