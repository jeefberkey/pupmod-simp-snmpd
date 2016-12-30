# Configure the global parts of the Embedded Perl Support.
#
# @see snmpd.conf(5) 'Embedded Perl Support'
#
# @param disable_perl
# @param perl_init_file
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
class snmpd::extension::perl::global (
  Boolean                        $disable_perl   = false,
  Optional[Stdlib::AbsolutePath] $perl_init_file = undef
) {

  simpcat_fragment { 'snmpd+ext.perl.global':
    content => template('snmpd/perl_global.erb')
  }
}
