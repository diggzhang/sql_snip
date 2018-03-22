-- create table drivers
create table drivers
(driverId int,
 name string,
 ssn bigint,
 location string,
 certified string,
 wageplan string)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES("skip.header.line.count"="1");

-- create table timesheet
create table timesheet
(driverId int,
 week int,
 hours_logged int,
 miles_logged int)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
TBLPROPERTIES("skip.header.line.count"="1");

LOAD DATA INPATH '/user/maria_dev/data/drivers.csv' OVERWRITE INTO TABLE drivers;
LOAD DATA INPATH '/user/maria_dev/data/timesheet.csv' OVERWRITE INTO TABLE timesheet;
