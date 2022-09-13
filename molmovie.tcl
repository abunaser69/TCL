for {set i 0} {$i < 1000} {incr i} {
    mol new [format "$i.pdb" $i]
}

# trigger auto-load of clone_reps
clone_reps 0 0
if {[lsearch [info commands] clone_reps] < 0} {
    puts "need clone_reps installed to replace the default visualization"
} else {
    # create a visualization for the first molecule
    # and then clone it upon the others.
    mol top 0
    mol delrep 0 top
    mol representation Licorice 0.150000 10.000000 10.000000
    mol color Name
    mol selection {all}
    mol material Opaque
    mol addrep top
    for {set i 1} {$i < [molinfo num]} {incr i} { clone_reps 0 $i }
}

# now disable displaying all molecules
for {set i 0} {$i < [molinfo num]} {incr i} { mol off $i }

# run animation for two loops
molmovie 1
