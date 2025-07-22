reset

set style line 1 lc rgb "blue" lw 3
set style line 2 lc rgb "red" lw 2

set xlabel "θ (rad)"
set ylabel "ω (rad/s)"

plot 'saida-d-f05-p1.dat' using 1:2 with lines ls 1 title 'Pêndulo 1','saida-d-f05-p2.dat' using 1:2 with lines ls 2 title 'Pêndulo 2'