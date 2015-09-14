#!/bin/bash


xitv=0.005
zitv=0.5
echo $xitv $zitv


gmt gmtset MAP_FRAME_PEN 1p MAP_FRAME_WIDTH 0.12c FONT_LABEL 8p MAP_LABEL_OFFSET 0.03c FONT_ANNOT_SECONDARY 8p FONT_ANNOT_PRIMARY 8p FONT_TITLE 8p PS_PAGE_ORIENTATION portrait MAP_GRID_PEN_PRIMARY 0.5p COLOR_MODEL cmyk



# Part 1 1 (x,y)

velfile4=n19.4_vper.txt

awk '{print $1,4.079-$3,$4}' "$velfile4" | gmt xyz2grd -R204.5/205.2/-65/5 -G$velfile4.grd -Ddegree/degree/s -I"$xitv"/"$zitv"

gmt makecpt -T-0.05/0.05/0.001 -D -I -Cpolar > $velfile4.cpt

gmt grdimage $velfile4.grd -JX10c/7.5c -C$velfile4.cpt -R204.5/205.2/-51/4.079 -B0.2/5WseN -K -Y5c> $velfile4.ps
awk '{print $1,4.079-$3}' elev_line.txt | gmt psxy -J -R -W2p -O -K >>$velfile4.ps
gmt psscale -D5c/-1c/6c/0.5ch -O -K -C$velfile4.cpt -B0.02 >> $velfile4.ps


