reset

set style line 1 lc rgb "blue" lw 3
set style line 2 lc rgb "red" lw 3
set style line 3 lc rgb "black" lw 3

set xlabel "Tempo (s)"
set ylabel "ω (rad/s)"

plot 'saida-b4-f0.dat' using 1:3 with lines ls 1 title 'F0 = 0','saida-b4-f05.dat' using 1:3 with lines ls 2 title 'F0 = 0,5','saida-b4-f12.dat' using 1:3 with lines ls 3 title 'F0 = 1,2'