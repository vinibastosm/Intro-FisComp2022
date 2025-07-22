reset

set style line 1 lc rgb "blue" lw 3
set style line 2 lc rgb "red" lw 3

set xlabel "Tempo (s)"
set ylabel "Energia (J)"

plot 'saida-a-energiaeuler.dat' using 1:2 with lines ls 2 title 'Euler','saida-a-energiaeulercromer.dat' using 1:2 with lines ls 1 title 'Euler-Cromer'