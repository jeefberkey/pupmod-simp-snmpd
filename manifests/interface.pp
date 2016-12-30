# Provide interface type and speed settings.
#
# @see snmpd.conf(5) 'Interfaces Group' for additional information.
#
# @param name
#   Maps to NAME in the man page.
#
# @param type
# @param speed
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::interface (
  $type,
  $speed
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.iface":
    content => "interface ${name} ${type} ${speed}\n",
  }
}
