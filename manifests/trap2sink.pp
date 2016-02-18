# == Define: snmpd::trap2sink
#
# See the 'Notification Handling' section of snmpd.conf(5) for details.
#
# $name must be unique between trapsink, trap2sink, and informsink.
#
# == Parameters
#
# [*$name*]
#   Becomes HOST in the man page.
#
# [*community*]
# [*port*]
#
# == Authors
#
# * Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::trap2sink (
  $community = '',
  $port = ''
) {
  if !empty($port) {
    validate_port($port)
  }

  include 'snmpd'

  concat_fragment { "snmpd+${name}.trap2.sink":
    content => "trap2sink ${name} ${community} ${port}\n"
  }
}
