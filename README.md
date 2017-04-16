# Set up of a MySQL database from the GeoNames dumps
Another simple MySQL script to build the GeoNames database, with an efficient structure and indexes, based on [the exportable dumps](http://download.geonames.org/export/dump/) and on the [postal codes dump](http://download.geonames.org/export/zip/).

## A user: a need

Download and unzip dumps according to your needs.
### Main information: cities, feature codes and hierarchy
* [download.geonames.org/export/dump/cities1000.zip](http://download.geonames.org/export/dump/cities1000.zip)
* [download.geonames.org/export/dump/cities5000.zip](http://download.geonames.org/export/dump/cities5000.zip)
* [download.geonames.org/export/dump/cities15000.zip](http://download.geonames.org/export/dump/cities15000.zip)

All GeoNames information should be relevant or not for you. By using cities tables (instead of allCountries table), you will upload only feature classes that are at least a small village (to a large metropole as a capital) with information on the population.
Data between this three table are redondante (cities in cities5000 are also in cities1000).
```sql
SELECT 
    a.fclass, a.fcode, COUNT(a.geonameid) AS NbGeoNamesId, b.name
FROM
    geo_01cities1000 AS a,
    geo_featurecodes AS b
WHERE
    b.code = CONCAT(a.fclass, '.', a.fcode)
GROUP BY a.fclass , a.fcode
ORDER BY NbGeoNamesId DESC
LIMIT 0,10;
```
fclass | fcode | NbGeoNamesId | name
--- | --- | --- | ---
P | PPL | 69408 | populated place
P | PPLA3 | 27195 | seat of a third-order administrative division
P | PPLA4 | 26600 | seat of a fourth-order administrative division
P | PPLA2 | 16160 | seat of a second-order administrative division
P | PPLA | 3483 | seat of a first-order administrative division
P | PPLX | 2336 | section of populated place
P | PPLC | 242 | capital of a political entity
P | PPLL | 239 | populated locality
P | PPLQ | 19 | abandoned populated place
P | PPLG | 14 | seat of government of a political entity



* [download.geonames.org/export/dump/featureCodes_en.txt](http://download.geonames.org/export/dump/featureCodes_en.txt)
* [download.geonames.org/export/dump/countryInfo.txt](http://download.geonames.org/export/dump/countryInfo.txt)
* [download.geonames.org/export/dump/admin1CodesASCII.txt](http://download.geonames.org/export/dump/admin1CodesASCII.txt)
* [download.geonames.org/export/dump/admin2Codes.txt](http://download.geonames.org/export/dump/admin2Codes.txt)
* [download.geonames.org/export/dump/hierarchy.zip](http://download.geonames.org/export/dump/hierarchy.zip)

### Unsing zip/postal codes
* [download.geonames.org/export/zip/allCountries.zip](http://download.geonames.org/export/zip/allCountries.zip)

Note: you will find all the regular expressions to collect zip codes in the table countryinfo in the two colomns: 
* **postalCodeRegex** : list of all the detailled regular expressions by countries (if exists) to collect postal / zip codes
* **postalCodeFormat** : basic patterns of the postal / zip codes 

## Set up all feature classes
For those who want all information, you can download, unzip, and build a table with all geonames feature classes. This table will have the same structure than cities1000, cities5000 and cities15000, and share some of information that are also listed in these three tables. 
* [download.geonames.org/export/dump/allCountries.zip](http://download.geonames.org/export/dump/allCountries.zip)

Pay attention, allcountries table:
* store more thant 1.5 go of information (without indexes)
* all feature classes are in it (with some uses, it can add a lot of false positives)
##  Excluded dumps
* alternateNames.zip (>100mo) alternative names for all the populated places (from allCountries.zip)
