# Configure /etc/snmp.conf for snmp client utilities.
#
# @see snmp.conf(5) for details on all variables.
# /usr/share/snmp/mibs is always prepended onto the mibdirs.
# /usr/local/share/snmp/mibs is always appended to mibdirs.
#
# @param default_port
# @param def_version
# @param def_community
# @param dump_packet
# @param do_debugging
# @param debug_tokens
# @param sixteen_bit_ids
# @param clientaddr
# @param client_recv_buf
# @param client_send_buf
# @param no_range_check
# @param no_token_warnings
# @param reverse_encode_ber
# @param def_security_name
# @param def_security_level
# @param def_passphrase
# @param def_auth_passphrase
# @param def_priv_passphrase
# @param def_auth_type
# @param def_priv_type
# @param def_context
# @param def_security_model
# @param def_auth_master_key
# @param def_auth_localized_key
# @param def_priv_master_key
# @param def_priv_localized_key
# @param mibdirs
# @param mibs
# @param show_mib_errors
# @param strict_comment_term
# @param mib_allow_underline
# @param mib_warning_level
# @param log_timestamp
# @param print_numeric_enums
# @param print_numeric_oids
# @param dont_breakdown_oids
# @param escape_quotes
# @param quick_printing
# @param print_value_only
# @param dont_print_units
# @param numeric_timeticks
# @param print_hex_text
# @param hex_output_length
# @param suffix_printing
# @param oid_output_format
# @param extended_index
# @param no_display_hint
# @param persistent_dir
# @param no_persistent_load
# @param no_persistent_save
# @param temp_file_pattern
# @param server_recv_buf
# @param server_send_buf
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::utils::conf (
  Optional[Simplib::Port]        $default_port           = undef,
  Enum['1','2c','3']             $def_version            = '3',
  String                         $def_community          = 'public',
  Boolean                        $dump_packet            = false,
  Boolean                        $do_debugging           = false,
  Optional[Array]                $debug_tokens           = undef,
  Boolean                        $sixteen_bit_ids        = false,
  Optional[Simplib::IP]          $clientaddr             = undef,
  Optional[Integer]              $client_recv_buf        = undef,
  Optional[Integer]              $client_send_buf        = undef,
  Boolean                        $no_range_check         = false,
  Boolean                        $no_token_warnings      = false,
  Optional[String]               $reverse_encode_ber     = undef,
  Optional[String]               $def_security_name      = undef,
  Snmpd::SecurityLevel           $def_security_level     = 'authPriv',
  Optional[String]               $def_passphrase         = undef,
  Optional[String]               $def_auth_passphrase    = undef,
  Optional[String]               $def_priv_passphrase    = undef,
  Enum['MD5','SHA']              $def_auth_type          = 'SHA',
  Enum['DES','AES']              $def_priv_type          = 'AES',
  Optional[String]               $def_context            = undef,
  Optional[String]               $def_security_model     = undef,
  Optional[String]               $def_auth_master_key    = undef,
  Optional[String]               $def_auth_localized_key = undef,
  Optional[String]               $def_priv_master_key    = undef,
  Optional[String]               $def_priv_localized_key = undef,
  Optional[Stdlib::AbsolutePath] $mibdirs                = undef,
  Array                          $mibs                   = ['ALL'],
  Boolean                        $show_mib_errors        = false,
  Optional[String]               $strict_comment_term    = undef,
  Boolean                        $mib_allow_underline    = true,
  Optional[Integer]              $mib_warning_level      = undef,
  Boolean                        $log_timestamp          = false,
  Boolean                        $print_numeric_enums    = false,
  Boolean                        $print_numeric_oids     = false,
  Boolean                        $dont_breakdown_oids    = false,
  Boolean                        $escape_quotes          = false,
  Boolean                        $quick_printing         = false,
  Boolean                        $print_value_only       = false,
  Boolean                        $dont_print_units       = false,
  Boolean                        $numeric_timeticks      = false,
  Boolean                        $print_hex_text         = false,
  Optional[Integer]              $hex_output_length      = undef,
  Optional[Integer[0,2]]         $suffix_printing        = undef,
  Optional[Integer[1,6]]         $oid_output_format      = undef,
  Boolean                        $extended_index         = true,
  Boolean                        $no_display_hint        = true,
  Optional[Stdlib::AbsolutePath] $persistent_dir         = undef,
  Boolean                        $no_persistent_load     = false,
  Boolean                        $no_persistent_save     = false,
  Optional[String]               $temp_file_pattern      = undef,
  Optional[Integer]              $server_recv_buf        = undef,
  Optional[Integer]              $server_send_buf        = undef
) {
  include '::snmpd'

  file { '/etc/snmp/snmp.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    content => template('snmpd/snmp.conf.erb'),
    notify  => Exec['set_snmp_perms']
  }
}
