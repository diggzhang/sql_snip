create table temp_drivers (col_value STRING);

load data inpath '/user/maria_dev/data/drivers.csv' overwrite into table temp_drivers;

select * from temp_drivers limit 10;

CREATE TABLE drivers (
    driverId INT,
    name STRING,
    ssn BIGINT,
    location STRING,
    certified STRING,
    wageplan STRING
);


insert overwrite table drivers
select
  regexp_extract(col_value, '^(?:([^,]*),?){1}', 1) driverId,
  regexp_extract(col_value, '^(?:([^,]*),?){2}', 1) name,
  regexp_extract(col_value, '^(?:([^,]*),?){3}', 1) ssn,
  regexp_extract(col_value, '^(?:([^,]*),?){4}', 1) location,
  regexp_extract(col_value, '^(?:([^,]*),?){5}', 1) certified,
  regexp_extract(col_value, '^(?:([^,]*),?){6}', 1) wageplan
from temp_drivers;

select * from drivers;
