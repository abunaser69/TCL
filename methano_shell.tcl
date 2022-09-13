atomselect macro pdcom {index 0 to 42}
atomselect macro menol {index 43 to 5995}
set sel1 [atomselect top "(same residue as (within 4.00 of pdcom))"]
set f1 [open "chopped1.xyz" w]
$sel1 writexyz chopped1.xyz
close $f1
set ndx1 [$sel1 get {index}]
set nam1 [$sel1 get {name index}]
set f2 [open "atomlist1.txt" w]
puts  $f2 $nam1
close $f2
set f3 [open "atomlist2.txt" w]
foreach ndx1 $ndx1 {
set out_ndx1 [expr $ndx1 + 1]
puts  -nonewline $f3  [format \ $out_ndx1]  } 
close $f3

atomselect macro mshell { same residue as (within 4.00 of pdcom)}
set sel2 [atomselect top "(same residue as not mshell)"]
set f4 [open "chopped2.xyz" w]
$sel2 writexyz chopped2.xyz
close $f4

set ndx2 [$sel2 get {index}]
set nam2 [$sel2 get {name index}]
set f5 [open "atomlist3.txt" w]
puts  $f5 $nam2
close $f5

set f6 [open "atomlist4.txt" w]
foreach ndx2 $ndx2 {
set out_ndx2 [expr $ndx2 + 1]
puts  -nonewline $f6  [format \ $out_ndx2]  }
close $f6
