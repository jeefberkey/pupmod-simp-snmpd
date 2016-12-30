# Set up an item to monitor.
#
# @see snmpd.conf(5) 'DisMan Event MIB' for additional information.
#
# $name
#   This translates to 'NAME' from the man page.
#
# @param expression
# @param options
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::disman::monitor (
  String           $expression,
  Optional[String] $options = undef
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+disman.${name}.monitor":
    content => "monitor ${options} ${name} ${expression}\n",
  }
}
