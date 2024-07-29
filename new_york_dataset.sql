

-- Listing All Tables in the Dataset
SELECT*
FROM bigquery-public-data.new_york_subway.INFORMATION_SCHEMA.TABLES;
  
  
--Listing All Columns in the Dataset
SELECT*
FROM bigquery-public-data.new_york_subway.INFORMATION_SCHEMA.COLUMNS;

--Listing Columns for Specific Tables
SELECT *
FROM bigquery-public-data.new_york_subway.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE table_name = 'station_complexes';



--Finding Common Columns Between Two Tables
SELECT column_name
FROM bigquery-public-data.new_york_subway.INFORMATION_SCHEMA.COLUMNS
WHERE table_name = 'stations' 
AND column_name IN (
    SELECT column_name
    FROM bigquery-public-data.new_york_subway.INFORMATION_SCHEMA.COLUMNS
    WHERE table_name = 'station_entrances'
 );

--Comprehensive Side-by-Side Column Comparison
SELECT 
    t1.column_name AS table1_column,
    t2.column_name AS table2_column
FROM 
    `bigquery-public-data.new_york_subway.INFORMATION_SCHEMA.COLUMNS` AS t1
LEFT JOIN 
    `bigquery-public-data.new_york_subway.INFORMATION_SCHEMA.COLUMNS` AS t2
ON 
    t1.column_name = t2.column_name
    AND t2.table_name = 'station_entrances'
WHERE 
    t1.table_name = 'stations'

UNION ALL

SELECT 
    t1.column_name AS table1_column,
    t2.column_name AS table2_column
FROM 
    `bigquery-public-data.new_york_subway.INFORMATION_SCHEMA.COLUMNS` AS t1
RIGHT JOIN 
    `bigquery-public-data.new_york_subway.INFORMATION_SCHEMA.COLUMNS` AS t2
ON 
    t1.column_name = t2.column_name
    AND t1.table_name = 'stations'
WHERE 
    t2.table_name = 'station_entrances'








