# @see snmpd.conf(5) 'MIB-Specific Extension Commands'
#
# @param name
#   Becomes part of the temporary file path. Do not use '/' in $name.
#
# @param ext_type
#     Should be one of 'pass' or 'pass_persist'
#
# @param miboid
# @param prog
# @param priority
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::extension::mib_specific (
  Snmpd::Extension::Mib_Specific::ExtType $ext_type,
  String $miboid,
  String $prog,
  Optional[String] $priority = undef
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+ext.${name}.${ext_type}":
    content => template('snmpd/mib_specific_ext.erb')
  }
}
