proc id_pick {} {
     # get the atom and molecule picked
     global vmd_pick_atom vmd_pick_mol
     # get residue name and id
     set atom [atomselect $vmd_pick_mol "index $vmd_pick_atom"]
     set ndx [$atom get {index}]
     set out_ndx [expr $ndx + 1]
     set nam [$atom get {name}]
     # print the result
     set f [open "index.txt" a ]
     puts $f "$nam  $out_ndx"
     close $f 
}

proc id_pick_trace_fctn {args} {
      id_pick
}

trace variable vmd_pick_atom w id_pick_trace_fctn
#trace vdelete vmd_pick_atom w id_pick_trace_fctn
