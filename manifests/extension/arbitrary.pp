# @see snmpd.conf(5) 'Arbitrary Extension Commands' for more information.
#
# @param name
#   This becomes part of the temporary file path and will be used as NAME.
#   Do not use '/' in the $name
#
# @param ext_type
#   The type of extension you want to enable, choices are:
#     - exec
#     - sh
#     - execfix
#     - extend
#     - extendfix
#
# @param prog
# @param args
# @param miboid
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::extension::arbitrary (
  $ext_type,
  $prog,
  $args,
  $miboid = ''
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+ext.${name}.${ext_type}":
    content => template('snmpd/arbitrary_ext.erb')
  }

  validate_array_member($ext_type, [
    'exec',
    'sh',
    'execfix',
    'extend',
    'extendfix'
  ])
}
