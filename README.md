# TugasSQL-Shell
**Objective :**
Filtering dan Cleaning data traffic ecommerce Oct-Nov 2019
Untuk data aktivitas pembelian saja dan memisahkan data kategori produk dan nama produk

**Detail :**
1. Menggabungkan 2 file csv Oct-Nov 2019

csvstack 2019-Nov-sample.csv 2019-Oct-sample.csv > ./2019-OctNov-sample.csv


2. seleksi kolom

csvcut -c 2,3,4,5,6,7,8 2019-OctNov-sample.csv > ./cleandata_kolom.csv


3. filter data

csvgrep -c "event_type" -m "purchase" cleandata_kolom.csv > ./cleandata_filter.csv


4. splitting kolom

cat cleandata_filter.csv | awk -F ',' '{print $1","$2","$3","$4","$6","$7","$5}'| awk -F '.' '{print $1"."$2","$NF}' > ./data_clean.csv

**Cara Running**

./data_clean_ecom.sh
