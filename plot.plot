#!/usr/bin/env gnuplot

#set terminal png size 2560,1440
set terminal pngcairo size 1280,720
set output "graph.png"
set xdata time
set timefmt "%s"
set datafile missing "0"
set grid
set format x "%H:%M"
set key center center
set ylabel "meters / km/h"
set y2label "uSv/h"
set ytics nomirror 1000
set y2tics 0.5
plot [1661690000:1661731200] [0:] \
     'rad.data' using 1:2 w l axis x1y2 title "Radiation (uSv/h)", \
     'flight1.data' using 1:2 w l axis x1y1 title "Altitude (m)", \
     'flight1.data' using 1:3 w l title "Velocity (km/h)" axis x1y1
