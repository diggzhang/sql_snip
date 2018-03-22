create table temp_timesheet (col_value string);

load data inpath '/user/maria_dev/data/timesheet.csv'
overwrite into table temp_timesheet;

select * from temp_timesheet limit 10;

CREATE TABLE timesheet (driverId INT, week INT, hours_logged INT , miles_logged INT);

insert overwrite table timesheet
SELECT
  regexp_extract(col_value, '^(?:([^,]*),?){1}', 1) driverId,
  regexp_extract(col_value, '^(?:([^,]*),?){2}', 1) week,
  regexp_extract(col_value, '^(?:([^,]*),?){3}', 1) hours_logged,
  regexp_extract(col_value, '^(?:([^,]*),?){4}', 1) miles_logged

from temp_timesheet;


select * from timesheet limit 10;

SELECT
    driverId,
    sum(hours_logged) total_hours,
    sum(miles_logged) total_miles
FROM timesheet
GROUP BY driverId


SELECT
    d.driverId,
    d.name,
    t.total_hours,
    t.total_miles
from drivers d
JOIN (
    SELECT
        driverId,
        sum(hours_logged)total_hours,
        sum(miles_logged)total_miles
    FROM timesheet
    GROUP BY driverId
) t
ON (d.driverId = t.driverId);
