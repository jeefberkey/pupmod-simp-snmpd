# Add the ability to load a dynamic module.
#
# @see snmpd.conf(5) 'Dynamically Loadable Modules'.
#
# @param name
#   NAME from the man page.
#
# @param path
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::dlmod (
  $path
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.module":
    content => "dlmod ${name} ${path}\n",
  }
}
