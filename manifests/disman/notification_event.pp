# @see snmpd.conf(5) 'DisMan Event MIB' for additional information.
#
# @param name
#    This translates to ENAME from the man page.
#
# @param notification
# @param varbinds_options
#   Must be fully defined including the -n, -i, or -o as appropriate.
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::disman::notification_event (
  String           $notification,
  Optional[String] $varbinds_options = undef
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+disman.${name}.ne":
    content => "notificationEvent ${name} ${notification} ${varbinds_options}\n"
  }
}
