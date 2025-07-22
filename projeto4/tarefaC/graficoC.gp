reset

set style line 1 lc rgb "blue" lw 3
set style line 2 lc rgb "red" lw 3

f(x) = a*x + b
fit f(x) 'saida-c-f05.dat' via a, b

g(x) = m*x + n
fit g(x) 'saida-c-f12.dat' via m, n

set xlabel "tempo (s)"
set ylabel "ln(Δθ)"

set multiplot layout 2, 1

plot 'saida-c-f05.dat' using 1:2 with lines ls 1 title 'F0 = 0,5',\
    f(x) with lines ls 2 notitle 

plot 'saida-c-f12.dat' using 1:2 with lines ls 1 title 'F0 = 1,2',\
    g(x) with lines ls 2 notitle