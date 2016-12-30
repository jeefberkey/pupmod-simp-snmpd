# Whether or not to generate authentication failure traps.
#
# @see snmpd.conf(5) - 'ACTIVE MONITORING > Notification Handling' for details.
#
# @param enable
#   The value to assign to authtrapenable.
#   Set to 2 -> disabled by default.
#
class snmpd::authtrapenable (
  $enable = false
) {
  validate_bool($enable)

  $l_enable = $enable ? {
    true    => '1',
    default => '2'
  }

  simpcat_fragment { 'snmpd+all.authtrapenable':
    content => "authtrapenable ${l_enable}\n"
  }
}
