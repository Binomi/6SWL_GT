reset

set terminal epslatex color
set xlabel 'Temperatur [$\si{\celsius}$]'
set ylabel 'Druck [hPa]'

f(x)=m*x+b

set output "gas1p.tex"
set fit logfile "gas1fit.log"
fit f(x) "gas1.txt" u 1:(($2*2+101.4)*10):($3*2) via m,b
p "gas1.txt" u 1:(($2*2+101.4)*10):($3*2) w e t "Messwerte", f(x) t "lineare Regression" lt -1 
set output
!epstopdf gas1p.eps

set output "gas2p.tex"
set fit logfile "gas2fit.log"
fit f(x) "gas2.txt" u 1:(($2*2+101.37)*10):($3*2) via m,b
p "gas2.txt" u 1:(($2*2+101.4)*10):($3*2) w e t "Messwerte", f(x) t "lineare Regression" lt -1
set output
!epstopdf gas2p.eps
#pause -1
