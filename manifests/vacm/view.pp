# @see snmpd.conf(5) for details.
#
# To set your views in a particular order, simply append a number to the
# end of the $name.
#
# @param vname
# @param oid
# @param v_type
# @param mask
#
# @author Trevor Vaughan <mailto:tvaughan@onyxpoint.com>
#
define snmpd::vacm::view (
  String           $vname,
  String           $oid,
  String           $v_type = 'included',
  Optional[String] $mask   = undef
) {
  if $mask {
    simpcat_fragment { "snmpd+${name}.view":
      content => "view ${vname} ${v_type} ${oid} ${mask}\n",
    }
  }
  else {
    simpcat_fragment { "snmpd+${name}.view":
      content => "view ${vname} ${v_type} ${oid}\n"
    }
  }
}
