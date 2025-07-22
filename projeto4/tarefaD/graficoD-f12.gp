reset

set style line 1 lc rgb "blue" lw 3
set style line 2 lc rgb "red" lw 3

set xlabel "θ (rad)"
set ylabel "ω (rad/s)"

set multiplot layout 2, 1

plot 'saida-d-f12-p1.dat' using 1:2 with lines ls 2 title 'Pêndulo 1'

plot 'saida-d-f12-p2.dat' using 1:2 with lines ls 1 title 'Pêndulo 2'