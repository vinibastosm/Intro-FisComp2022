reset

set size square
set style line 1 lc rgb "blue" lw 2
set style line 2 lc rgb "green" lw 2
set style line 3 lc rgb "red" lw 2
set style line 4 lc rgb "orange" lw 2
set style line 5 lc rgb 'black' pt 7 lw 8
 
set xlabel "x (UA)"
set ylabel "y (UA)"

plot 'saida-b3-jupiter.dat' using 1:2 with lines ls 1 title 'Júpiter',\
     'saida-b3-ast1.dat' using 1:2 with lines ls 2 title 'Asteroide I',\
     'saida-b3-ast2.dat' using 1:2 with lines ls 3 title 'Asteroide II',\
     'saida-b3-ast3.dat' using 1:2 with lines ls 4 title 'Asteroide III',\
     "<echo '0 0'" with points ls 5 title 'Sol'