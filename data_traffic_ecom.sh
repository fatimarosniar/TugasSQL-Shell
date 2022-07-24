#!/bin/bash

#1. Gabungkan Data
csvstack 2019-Nov-sample.csv 2019-Oct-sample.csv > ./2019-OctNov-sample.csv

#2. Penyeleksian Kolom
csvcut -c 2,3,4,5,6,7,8 2019-OctNov-sample.csv > ./cleandata_kolom.csv

#3. Filtering Data
csvgrep -c "event_type" -m "purchase" cleandata_kolom.csv > ./cleandata_filter.csv

#4. Splitting Kolom"
cat cleandata_filter.csv | awk -F ',' '{print $1","$2","$3","$4","$6","$7","$5}'| awk -F '.' '{print $1"."$2","$NF}' > ./dataclean.csv
