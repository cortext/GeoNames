# GeoNames MySQL
Another simple MySQL script to build the GeoNames database, with an efficient structure and indexes, based on the exportable dump (http://download.geonames.org/export/dump/) and on the postal codes dump (http://download.geonames.org/export/zip/).

##  Download and unzip dumps
* download.geonames.org/export/dump/cities1000.zip
* download.geonames.org/export/dump/cities5000.zip
* download.geonames.org/export/dump/cities15000.zip
* download.geonames.org/export/dump/featureCodes_en.txt
* download.geonames.org/export/dump/countryInfo.txt
* download.geonames.org/export/dump/admin1CodesASCII.txt
* download.geonames.org/export/dump/admin2Codes.txt
* download.geonames.org/export/zip/allCountries.zip
* download.geonames.org/export/dump/hierarchy.zip

##  Excluded dumps
* allCountries.zip (>300mo) but corresponding table has the same structure than cities1000, cities5000 or cities15000;
* alternateNames.zip (>100mo) alternative names for all the populated places (from allCountries.zip)