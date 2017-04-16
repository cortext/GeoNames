# Set up of a MySQL database from the GeoNames dumps
Another simple MySQL script to build the GeoNames database, with an efficient structure and indexes, based on the exportable dump (http://download.geonames.org/export/dump/) and on the postal codes dump (http://download.geonames.org/export/zip/).

## A user: a need

Download and unzip dumps
### Main information: cities, feature codes and hierarchy
* download.geonames.org/export/dump/cities1000.zip
* download.geonames.org/export/dump/cities5000.zip
* download.geonames.org/export/dump/cities15000.zip

Depending of your needs, all GeoNames information should be relevant or not. By using cities tables (instead of allCountries tables), you will manipulate only feature classes that are at least a small village (to a large metropole as a capital) with information on the population.

* download.geonames.org/export/dump/featureCodes_en.txt
* download.geonames.org/export/dump/countryInfo.txt
* download.geonames.org/export/dump/admin1CodesASCII.txt
* download.geonames.org/export/dump/admin2Codes.txt
* download.geonames.org/export/dump/hierarchy.zip

### Unsing zip/postal codes
* download.geonames.org/export/zip/allCountries.zip
```
Note: you will find all the regular expressions to collect zip codes in the table countryinfo in the two colomns: 
* postalCodeRegex : list of all the detailled regular expressions by countries (if exists) to collect postal / zip codes
* postalCodeFormat : basic pattern of the postal / zip codes 
```
## Setup all feature classes
For those who want all the feature classes, you can download, unzip, and build a table with all geonames feature classes. Some of these information will be redondante with cities1000, cities5000 and cities15000.
* download.geonames.org/export/dump/allCountries.zip
Pay attention, allcountry table:
* store more thant 1.5 go of information (without indexes)
* all feature classes are in it (with some uses, it can add a lot of false positives)
##  Excluded dumps
* alternateNames.zip (>100mo) alternative names for all the populated places (from allCountries.zip)
