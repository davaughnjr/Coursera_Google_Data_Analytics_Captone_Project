-- Merging data into one table

DROP TABLE IF EXISTS `capstone-452719.Cyclistic.tripdata_202306_202405`;

--merging all 12 months of data into a single table, this year consisit of 06/2023-05/2024

CREATE TABLE IF NOT EXISTS `capstone-452719.Cyclistic.tripdata_202306_202405` AS (
  SELECT * FROM `capstone-452719.Cyclistic.tripdata_2023_06`
  UNION ALL
  SELECT * 
  FROM `capstone-452719.Cyclistic.tripdata_2023_07`
  UNION ALL
  SELECT * 
  FROM `capstone-452719.Cyclistic.tripdata_2023_08`
  UNION ALL
  SELECT * 
  FROM `capstone-452719.Cyclistic.tripdata_2023_09`
  UNION ALL
  SELECT * 
  FROM `capstone-452719.Cyclistic.tripdata_2023_10`
  UNION ALL
  SELECT * 
  FROM `capstone-452719.Cyclistic.tripdata_2023_11`
  UNION ALL
  SELECT * 
  FROM `capstone-452719.Cyclistic.tripdata_2023_12`
  UNION ALL
  SELECT * 
  FROM `capstone-452719.Cyclistic.tripdata_2024_01`
  UNION ALL
  SELECT * 
  FROM `capstone-452719.Cyclistic.tripdata_2024_02`
  UNION ALL
  SELECT * 
  FROM `capstone-452719.Cyclistic.tripdata_2024_03`
  UNION ALL
  SELECT * 
  FROM `capstone-452719.Cyclistic.tripdata_2024_04`
  UNION ALL
  SELECT * 
  FROM `capstone-452719.Cyclistic.tripdata_2024_05`
  );

-- checking the number of rows

SELECT COUNT(*)
FROM `capstone-452719.Cyclistic.tripdata_202306_202405`;
