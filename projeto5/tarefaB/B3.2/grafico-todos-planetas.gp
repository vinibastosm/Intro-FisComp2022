reset

set size square
set style line 1 lc rgb "orange" lw 2
set style line 2 lc rgb "yellow" lw 2
set style line 3 lc rgb "blue" lw 2
set style line 4 lc rgb "red" lw 2
set style line 5 lc rgb "green" lw 2
set style line 6 lc rgb "black" lw 2
set style line 7 lc rgb "purple" lw 2
set style line 8 lc rgb "grey" lw 2
set style line 9 lc rgb "" lw 2
set style line 10 lc rgb 'black' pt 7 lw 8

set xlabel "x (UA)"
set ylabel "y (UA)"

set title "Sistema Solar"

plot 'saida-mercurio.dat' using 1:2 with lines ls 1 title 'Mercúrio',\
     'saida-venus.dat' using 1:2 with lines ls 2 title 'Vênus',\
     'saida-terra.dat' using 1:2 with lines ls 3 title 'Terra',\
     'saida-marte.dat' using 1:2 with lines ls 4 title 'Marte',\
     'saida-jupiter.dat' using 1:2 with lines ls 5 title 'Júpiter',\
     'saida-saturno.dat' using 1:2 with lines ls 6 title 'Saturno',\
     'saida-urano.dat' using 1:2 with lines ls 7 title 'Urano',\
     'saida-netuno.dat' using 1:2 with lines ls 8 title 'Netuno',\
     'saida-plutao.dat' using 1:2 with lines ls 9 title 'Plutão',\
     "<echo '0 0'" with points ls 10 title 'Sol'