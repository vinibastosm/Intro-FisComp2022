reset

set style line 1 lc rgb "blue" lw 2
set style line 2 lc rgb "red" lw 2 

set xlabel "θ (rad)"
set ylabel "ω (rad/s)"
set xrange [-6.28 : 6.28]
set yrange [-5: 8]

set multiplot layout 2, 1

plot 'saida-e-f12-p1.dat' using 1:2 with lines ls 2 title 'θ_0 = 1,2 rad'

plot 'saida-e-f12-p2.dat' using 1:2 with lines ls 1 title 'θ_0 = 2,4 rad'