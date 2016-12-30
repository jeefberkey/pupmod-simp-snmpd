# @see the 'OTHER CONFIGURATION' section of snmpd.conf(5) for details.
#
# @param name
#   Translates to HOST from the man page entry.
#
# @param handler_type
#   May be one of: stash_cache, debug, read_only, serialize, or bulk_to_next
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::inject_handler (
  $handler_type,
  $modulename
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.${handler_type}.inject":
    content => "injectHandler ${handler_type} ${modulename}\n"
  }

  validate_array_member($handler_type, [
    'stash_cache',
    'debug',
    'read_only',
    'serialize',
    'bulk_to_next'
  ])
}
