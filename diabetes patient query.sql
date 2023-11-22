--CREATE TABLE Public.diabetes(Pregnancies int, Glucose int, BloodPressure int, SkinThickness int, Insulin int, BMI float, DiabetesPedigreeFunction float, Age int, Outcome int)
--COPY Public.diabetes FROM 'C:\Users\user\Downloads\Project 2 - Diabetes Data-20231009T140959Z-001\Project 2 - Diabetes Data\Project 2 MeriSKILL\diabetes.csv' DELIMITER ',' CSV HEADER;
 
SELECT
    MIN(Pregnancies) as min_number_of_pregancy,
    MAX(Pregnancies) as max_number_of_pregancy,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY Pregnancies) as median_Pregnancy
FROM diabetes

SELECT
    MIN(Glucose) as min_Glucose_level,
    MAX(Glucose) as max_number_Glucose_level,
	ROUND(AVG(Glucose), 1) AS Avg_Glucose_level,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY Glucose) as median_Glucose_level
FROM diabetes


SELECT COUNT(*) AS total_count 
FROM diabetes;

SELECT outcome, COUNT(*) AS class_count
FROM diabetes
GROUP BY outcome;

SELECT
  outcome,
  COUNT(*) AS class_count,
  ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM diabetes),1) AS class_balance_percentage
FROM diabetes
GROUP BY outcome;

WITH dataset_counts AS (
  SELECT
    COUNT(*) AS total_count,
    ROUND(COUNT(*) * 0.7,0) AS training_count
  FROM diabetes
)
SELECT
  total_count,
  training_count,
  total_count - training_count AS testing_count
FROM dataset_counts;

SELECT *, ROW_NUMBER() OVER (ORDER BY random()) AS row_num
FROM diabetes;

WITH dataset_counts AS (
  SELECT
    COUNT(*) AS total_count,
    ROUND(COUNT(*) * 0.7,0) AS training_count
  FROM diabetes
)
SELECT *
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY random()) AS row_num
  FROM diabetes
) AS random_data
WHERE row_num <= (SELECT training_count FROM dataset_counts);

WITH dataset_counts AS (
  SELECT
    COUNT(*) AS total_count,
    ROUND(COUNT(*) * 0.7,0) AS training_count
  FROM diabetes
)
SELECT *
FROM (
  SELECT *, ROW_NUMBER() OVER (ORDER BY random()) AS row_num
  FROM diabetes
) AS random_data
WHERE row_num > (SELECT training_count FROM dataset_counts);


SELECT * FROM pg_available_extensions WHERE name = 'plpython2';


