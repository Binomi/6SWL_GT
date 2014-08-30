reset

set terminal epslatex color
f(x)=m*x+b

set xlabel 'Energie $\Delta$Q [J]'
set ylabel 'Druckänderung $\Delta$ p [Pa]'
set key top left

set output 'kondwarm.tex'
set fit logfile 'kondwarmfit.log'
fit f(x) "warmdat.txt" u 1:($3*(1+(4/9.2**2))):4 via m,b
p f(x) t 'Regressionsgeraden', "warmdat.txt" u 1:($3*(1+(4/9.2**2))):2:4 w xye t "Messwerte"

set output 
!epstopdf kondwarm.eps
