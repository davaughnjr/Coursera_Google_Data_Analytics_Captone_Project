-- checking data type from colums

SELECT column_name, data_type
FROM `Cyclistic`.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'tripdata_202306_202405';

-- checking for nulls in all colums

SELECT COUNT(*) - COUNT(ride_id) ride_id,
  COUNT(*) - COUNT(rideable_type) rideable_type,
  COUNT(*) - COUNT(started_at) started_at,
  COUNT(*) - COUNT(ended_at) ended_at,
  COUNT(*) - COUNT(start_station_name) start_station_name,
  COUNT(*) - COUNT(start_station_id) start_station_id,
  COUNT(*) - COUNT(end_station_name) end_station_name,
  COUNT(*) - COUNT(end_station_id) end_station_id,
  COUNT(*) - COUNT(member_casual) member_casual
FROM `capstone-452719.Cyclistic.tripdata_202306_202405`;

-- checking for duplicate rows with ride_id

SELECT COUNT(ride_id) - COUNT(DISTINCT ride_id) AS duplicate_rows
FROM `capstone-452719.Cyclistic.tripdata_202306_202405`;

-- checking the length of ride_id is equal to 16

SELECT LENGTH(ride_id) AS ride_id_length, COUNT(ride_id) AS no_of_rows
FROM `capstone-452719.Cyclistic.tripdata_202306_202405`
WHERE LENGTH(ride_id) = 16
GROUP BY ride_id_length;

-- rideable_type listed 3 types of bikes - Number of total trips with each bike

SELECT DISTINCT rideable_type, COUNT(rideable_type) AS no_of_trips
FROM `capstone-452719.Cyclistic.tripdata_202306_202405`
GROUP BY rideable_type;

-- started_at, ended_at - TIMESTAMP - YYYY-MM-DD hh:mm:ss UTC

SELECT started_at, ended_at
FROM `capstone-452719.Cyclistic.tripdata_202306_202405`
LIMIT 10;
SELECT COUNT(*) AS longer_than_a_day
FROM `capstone-452719.Cyclistic.tripdata_202306_202405`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) >= 1440;   -- longer than a day - total rows = 5360
SELECT COUNT(*) AS less_than_a_minute
FROM `capstone-452719.Cyclistic.tripdata_202306_202405`
WHERE (
  EXTRACT(HOUR FROM (ended_at - started_at)) * 60 +
  EXTRACT(MINUTE FROM (ended_at - started_at)) +
  EXTRACT(SECOND FROM (ended_at - started_at)) / 60) <= 1;      -- less than a minute - total rows = 122283

  -- member_casual listed 2 types sunscriptions - Number of total trips with each subscription

SELECT DISTINCT member_casual, COUNT(member_casual) AS no_of_trips
FROM `capstone-452719.Cyclistic.tripdata_202306_202405`
GROUP BY member_casual;
