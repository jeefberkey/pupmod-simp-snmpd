# Add a PERL expression or script for snmpd to evaluate.
#
# @param name
#   Becomes part of the temp file path. Do not use '/' as part of $name.
#
# @param expression
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::extension::perl::expression (
  $expression
) {
  include 'snmpd'

  simpcat_fragment { "snmpd+ext.perl.exp.${name}":
    content => "perl ${expression}\n"
  }
}
