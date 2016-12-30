# Add the ability to create a user.
#
# @see the 'SNMPv3 Users' section of snmpd.conf(5) for details.
#
# @param name
#   The username applied into the system.
#
# @param auth_phrase
# @param priv_phrase
# @param auth_type
# @param priv_type
# @param engine_id
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::createuser (
  $auth_phrase,
  $priv_phrase,
  $auth_type = 'SHA',
  $priv_type = 'AES',
  $engine_id = ''
) {
  include 'snmpd'

  if empty($engine_id) {
    $lcontent =
      "createUser ${name} ${auth_type} ${auth_phrase} ${priv_type} ${priv_phrase}\n"
  }
  else {
    $lcontent =
      "createUser -e ${engine_id} ${name} ${auth_type} ${auth_phrase} ${priv_type} ${priv_phrase}\n"
  }

  simpcat_fragment { "snmpd+${name}.user":
    content => $lcontent
  }
}
