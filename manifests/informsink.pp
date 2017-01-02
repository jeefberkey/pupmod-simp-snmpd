# Add the ability to create a user.
#
# @see the 'Notification Handling' section of snmpd.conf(5) for details.
#
# $name must be unique between trapsink, trap2sink, and informsink.
#
# @param name
#   Translates to HOST from the man page entry.
#
# @param community
# @param port
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::informsink (
  Optional[String]        $community = undef,
  Optional[Simplib::Port] $port      = undef
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+${name}.inform.sink":
    content => "informsink ${name} ${community} ${port}\n"
  }
}
