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
  $vname,
  $oid,
  $v_type = 'included',
  $mask = ''
) {
  if empty($mask) {
    simpcat_fragment { "snmpd+${name}.view":
      content => "view ${vname} ${v_type} ${oid}\n"
    }
  }
  else {
    simpcat_fragment { "snmpd+${name}.view":
      content => "view ${vname} ${v_type} ${oid} ${mask}\n",
    }
  }
}
