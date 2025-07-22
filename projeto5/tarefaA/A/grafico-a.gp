reset

set size square
set style line 1 lc rgb "blue" lw 5
set style line 2 lc rgb "green" lw 2
set style line 3 lc rgb "red" lw 3
set style line 4 lc rgb 'black' pt 7 lw 8
 
set xlabel "x (UA)"
set ylabel "y (UA)"

plot 'saida-a-menor.dat' using 1:2 with lines ls 1 title 'Δt = 0,00001 ano',\
     'saida-a-maior.dat' using 1:2 with lines ls 2 title 'Δt = 0,05 ano',\
     'saida-a-certa.dat' using 1:2 with lines ls 3 title 'Δt = 0,002739726 ano',\
     "<echo '0 0'" with points ls 4 title 'Sol'