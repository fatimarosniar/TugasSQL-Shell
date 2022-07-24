# TugasSQL-Shell
**Objective :**
Filtering dan Cleaning data traffic ecommerce Oct-Nov 2019
Untuk data aktivitas pembelian saja dan memisahkan data kategori produk dan nama produk

**Detail :**
1. Menggabungkan 2 file csv Oct-Nov 2019

csvstack 2019-Nov-sample.csv 2019-Oct-sample.csv > ./2019-OctNov-sample.csv


2. Menyeleksi kolom yang dibutuhkan

csvcut -c 2,3,4,5,6,7,8 2019-OctNov-sample.csv > ./cleandata_kolom.csv


3. Filter data pembelian saja

csvgrep -c "event_type" -m "purchase" cleandata_kolom.csv > ./cleandata_filter.csv


4. splitting kolom kategori produk dan nama produk

cat cleandata_filter.csv | awk -F ',' '{print $1","$2","$3","$4","$6","$7","$5}'| awk -F '.' '{print $1"."$2","$NF}' > ./data_clean.csv

**Cara Running**
1. download data set dan save data di file direktori

wget https://www.dropbox.com/s/x2vtbiasvghf93b/2019-Nov-sample.csv https://www.dropbox.com/s/1lucclupwo2d3fm/2019-Oct-sample.csv

2. running filter data

./data_clean_ecom.sh
