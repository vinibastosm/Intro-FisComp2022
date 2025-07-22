reset

set size square
set style line 1 lc rgb "blue" lw 3
set style line 2 lc rgb "green" lw 3
set style line 3 lc rgb "red" lw 3
set style line 4 lc rgb 'black' pt 7 lw 8
 
set xlabel "x (UA)"
set ylabel "y (UA)"

plot 'saida-b1-terra.dat' using 1:2 with lines ls 1 title 'Terra',\
     'saida-b1-jupiter.dat' using 1:2 with lines ls 3 title 'Júpiter',\
     "<echo '0 0'" with points ls 4 title 'Sol'