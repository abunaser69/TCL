     set sel [atomselect top all]
     set coords [lsort -real [$sel get x]]
     set minx [lindex $coords 0]
     set maxx [lindex [lsort -real -decreasing $coords] 0]

     set coords [lsort -real [$sel get y]]
     set miny [lindex $coords 0]
     set maxy [lindex [lsort -real -decreasing $coords] 0]

     set coords [lsort -real [$sel get z]]
     set minz [lindex $coords 0]
     set maxz [lindex [lsort -real -decreasing $coords] 0]

puts "$minx $maxx $miny $maxy $minz $maxz"

set ratio 0.6

set rminx [expr $minz*$ratio]
set rmaxx [expr $maxx*$ratio]
set rminy [expr $miny*$ratio]
set rmaxy [expr $maxy*$ratio]
set rminz [expr $minz*$ratio]
set rmaxz [expr $maxz*$ratio]

puts "$rminx $rmaxx $rminy $rmaxy $rminz $rmaxz"

set sel2 [atomselect top "(same residue as ( x >= $rminx and x <= $rmaxx and \
                         y >= $rminy and y <= $rmaxy and \
                         z >= $rminz and z <= $rmaxz))"]
$sel2 writexyz chopped.xyz
