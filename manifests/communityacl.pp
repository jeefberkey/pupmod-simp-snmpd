# Set up the following variables in snmpd.conf:
# * rocommunity
# * rwcommunity
# * rocommunity6
# * rwcommunity6
#
# @see the 'Traditional Access Control' segment of snmpd.conf(5) for details.
#
# @param name
#   This becomes part of the temp file path. Do not use '/' in $name.
#
# @param community
#     The COMMUNITY portion of the option string.
#
# @param ro
#   Whether or not this is a read-only community.
#
# @param source
#   The SOURCE portion of the option string.
#
# @param oid
#   The OID portion of the option string.
#
# @param ipv6
#   Whether or not this is an ipv6 community.
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::communityacl (
  String           $community,
  Boolean          $ro     = true,
  Optional[String] $source = undef,
  Optional[String] $oid    = undef,
  Boolean          $ipv6   = false
) {
  include '::snmpd'

  simpcat_fragment { "snmpd+${name}.comm":
    content => template('snmpd/acl.erb')
  }
}
