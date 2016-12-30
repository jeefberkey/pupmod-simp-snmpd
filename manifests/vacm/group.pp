# Maps a security name (in the specified security model) into a named group. Several group
# directives can specify the same group name, allowing a single access setting to apply to
# several users and/or community strings.
#
# @see snmpd.conf(5) for more details.
#
# @note $sec_model defaults to 'usm' for SNMPv3
# @note You will need two of these if using v1 and v2
#
# @param group
# @param secname
# @param sec_model
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::group (
  $group,
  $secname,
  $sec_model = 'usm'
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+${name}.group":
    content => "group ${group} ${sec_model} ${secname}\n",
  }

  validate_array_member($sec_model, [
    'v1',
    'v2c',
    'usm',
    'tsm',
    'ksm'
  ])
}
