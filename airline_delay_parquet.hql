Create table airline_delay_parquet(
Year INT, Month INT, DayofMonth INT,
DayOfWeek INT, DepTime INT, CRSDepTime INT,
ArrTime INT, CRSArrTime INT, UniqueCarrier STRING,
FlightNum INT, TailNum STRING, ActualElapsedTime  INT,
CRSElapsedTime INT, AirTime INT, ArrDelay  INT,
DepDelay INT, Origin STRING, Dest STRING,
Distance  INT, TaxiIn  INT, TaxiOut INT,
Cancelled	 INT, 
CancellationCode STRING
COMMENT 'A = carrier, B = weather, C = NAS, D = security',
Diverted  INT COMMENT '1 = yes, 0 = no',
CarrierDelay STRING, WeatherDelay STRING, NASDelay STRING,
SecurityDelay STRING, LateAircraftDelay STRING)
PARTITIONED by (delayYear INT)
ROW FORMAT DELIMITED
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\n'
	STORED AS PARQUET;

LOAD DATA INPATH '/DD/2008.csv'
OVERWRITE INTO TABLE airline_delay_parquet
PARTITION (delayYear =2008);