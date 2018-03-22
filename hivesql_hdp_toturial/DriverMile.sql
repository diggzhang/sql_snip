CREATE TABLE DriverMileage
STORED AS ORC AS
SELECT driverid, sum(miles) totmiles
FROM truck_mileage
GROUP BY driverid;

SELECT * FROM drivermileage LIMIT 100;
