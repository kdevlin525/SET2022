#!/bin/bash

#stuff that adds things to the .gmtcommands file in this dir
ps=location.eps

gmt set PROJ_LENGTH_UNIT inch MAP_FRAME_TYPE plain PS_MEDIA letter FONT_ANNOT_PRIMARY Helvetica
gmt psbasemap -X0.7 -Y0.5 -P -R-120.5/-118.75/35/36.5 -JM7 -Ba0.5/a0.5WeSn -K > $ps
gmt grdimage LandsatAnn_2000.tiff  -J -R -D  -V -K -O >> $ps
psxy -J -R -L -K -O -V -W2,white -: >> $ps <<EOF
36.1416 -119.0927
36.3068 -120.2681
35.8752 -120.3623
35.7093 -119.1895
EOF
psxy -J -R -Gwhite -L -K -O -V -W1 -: >>$ps <<EOF
35 -119.15
35 -118.85
35.1 -118.85
35.1 -119.15
EOF
gmt set  FONT_ANNOT_PRIMARY Helvetica-Bold
gmt pscoast -Lx6/0.25+c35.4+w20 -J -R -A1/0/1 -N2 -N1 -Df -W0.5 -S150/150/200 -K  -O >> $ps

gmt set FONT_ANNOT_PRIMARY Helvetica

psxy points.txt -J -R -K -O -V -: -Sc0.05 -Gred  >> $ps
gmt psbasemap  -R-126/-112/31/44 -JM1 -K -O -Ba100wesn -Gwhite  >>$ps
psxy -J -R -L -K -O -V -W1 -: >>$ps <<EOF
35 -120.5
35 -118.75
36.5 -118.75
36.5 -120.5
EOF
gmt pscoast -J -R -N2 -Di -W0.05 -A1/0/1 -O >>$ps
gmt psconvert location.eps -TG


