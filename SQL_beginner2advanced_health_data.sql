-- DDL: Create the diabetes_data table with appropriate data types
CREATE TABLE diabetes_data (
    Diabetes_binary FLOAT,
    HighBP FLOAT,
    HighChol FLOAT,
    CholCheck FLOAT,
    BMI FLOAT,
    Smoker FLOAT,
    Stroke FLOAT,
    HeartDiseaseorAttack FLOAT,
    PhysActivity FLOAT,
    Fruits FLOAT,
    Veggies FLOAT,
    HvyAlcoholConsump FLOAT,
    AnyHealthcare FLOAT,
    NoDocbcCost FLOAT,
    GenHlth FLOAT,
    MentHlth FLOAT,
    PhysHlth FLOAT,
    DiffWalk FLOAT,
    Sex FLOAT,
    Age FLOAT,
    Education FLOAT,
    Income FLOAT
);

--  ####################### Beginner Level SQL ########################

-- ***** 1. SELECT *****

-- Select all columns
SELECT * FROM diabetes_data;

-- Select specific columns
SELECT Diabetes_binary, Age, BMI, GenHlth FROM diabetes_data;

-- Count total records in the table
SELECT COUNT(*) AS total_records FROM diabetes_data;


-- ***** 2. Filtering Data (WHERE) *****

-- Filter records where the patient has diabetes
SELECT * 
FROM diabetes_data 
WHERE Diabetes_binary = 1;

-- Filter records where BMI is greater than or equal to 25
SELECT * 
FROM diabetes_data 
WHERE BMI >= 25;

-- ***** 3. Sorting Data (ORDER BY) *****

-- Sort records by BMI in ascending order
SELECT * 
FROM diabetes_data 
ORDER BY BMI ASC;

-- Sort records by BMI in descending order
SELECT * 
FROM diabetes_data 
ORDER BY BMI DESC;

-- ***** 4. Unique Values (DISTINCT) *****

-- Get distinct values of Age
SELECT DISTINCT Age
FROM diabetes_data;

-- Sort records by Age Range in descending order
SELECT DISTINCT Age
FROM diabetes_data
ORDER BY Age DESC;



-- ####################### Intermediate Level ########################

-- ***** 5. Aggregations (COUNT, AVG, MIN, MAX, SUM) *****

-- Calculate average BMI
SELECT AVG(BMI) AS average_bmi 
FROM diabetes_data;

-- Find minimum and maximum BMI
SELECT MIN(BMI) AS min_bmi, MAX(BMI) AS max_bmi 
FROM diabetes_data;

-- Count patients with diabetes
SELECT COUNT(*) AS diabetes_patients 
FROM diabetes_data 
WHERE Diabetes_binary = 1;

-- ***** 6. Grouping Data (GROUP BY) *****

-- Group by Age and count diabetes cases
SELECT Age, 
       COUNT(CASE WHEN Diabetes_binary = 1 THEN 1 END) AS diabetes_cases
FROM diabetes_data
GROUP BY Age
ORDER BY Age;

-- Group by HighBP and count occurrences
SELECT HighBP, COUNT(*) AS count_by_highbp 
FROM diabetes_data
GROUP BY HighBP;

-- ***** 7. Conditional Logic (CASE) *****

-- Add the Age_Range column
ALTER TABLE diabetes_data
ADD Age_Range VARCHAR(20);

-- Populate the Age_Range column
UPDATE diabetes_data
SET Age_Range = CASE 
    WHEN Age = 1 THEN '18-24'
    WHEN Age = 2 THEN '25-29'
    WHEN Age = 3 THEN '30-34'
    WHEN Age = 4 THEN '35-39'
    WHEN Age = 5 THEN '40-44'
    WHEN Age = 6 THEN '45-49'
    WHEN Age = 7 THEN '50-54'
    WHEN Age = 8 THEN '55-59'
    WHEN Age = 9 THEN '60-64'
    WHEN Age = 10 THEN '65-69'
    WHEN Age = 11 THEN '70-74'
    WHEN Age = 12 THEN '75-79'
    WHEN Age = 13 THEN '80+'
END;


SELECT 
  Age_Range,
  COUNT(CASE WHEN Diabetes_binary = 1 THEN 1 END) * 100.0 / COUNT(*) AS diabetes_rate
FROM diabetes_data
GROUP BY Age_Range
ORDER BY Age_Range;

-- Calculate Diabetes Rate by Age_Range with Case When

SELECT 
  Age_Range,
  COUNT(CASE WHEN Diabetes_binary = 1 THEN 1 END) * 100.0 / COUNT(*) AS diabetes_rate
FROM diabetes_data
GROUP BY Age_Range
ORDER BY Age_Range;

-- Round Usage

SELECT 
  Age_Range,
  ROUND(COUNT(CASE WHEN Diabetes_binary = 1 THEN 1 END) * 100.0 / COUNT(*), 2) AS diabetes_rate
FROM diabetes_data
GROUP BY Age_Range
ORDER BY Age_Range;

-- ####################### Advanced Level #################

-- ***** 8. Subqueries *****

-- List patients with diabetes who fall into the most common Age_Range for diabetics
SELECT *
FROM diabetes_data
WHERE Age_Range = (
    SELECT Age_Range
    FROM diabetes_data
    WHERE Diabetes_binary = 1
    GROUP BY Age_Range
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
  AND Diabetes_binary = 1;

  -- 9. ***** Common Table Expressions (CTEs)*****

-- Calculate average BMI using CTE
WITH AvgBMI AS (
    SELECT AVG(BMI) AS average_bmi
    FROM diabetes_data
)
SELECT * 
FROM AvgBMI;

-- 10. *****  Data Modification (INSERT, UPDATE, DELETE) *****


-- Update gender data for  patients

ALTER TABLE diabetes_data
ALTER COLUMN Sex TYPE text;


UPDATE diabetes_data
SET Sex = CASE 
    WHEN Sex = '0' THEN 'Female'
    WHEN Sex = '1' THEN 'Male'
END;

SELECT Sex
FROM diabetes_data;

-- Delete records where Physical Activity is 0
DELETE FROM diabetes_data
WHERE PhysActivity = 0;


-- ***** 11. Advanced Filtering (HAVING)

-- Group by Age and filter groups with more than 10 patients
SELECT Age, COUNT(*) AS patient_count
FROM diabetes_data
GROUP BY Age
HAVING COUNT(*) > 1000;

-- ***** Additional Topics *****

-- *** Primary Key ***

-- Adding Primary Key
ALTER TABLE diabetes_data
ADD COLUMN Patient_ID SERIAL PRIMARY KEY;

SELECT * 
FROM diabetes_data;

-- *** LIMIT *** 

SELECT * 
FROM diabetes_data
ORDER BY MentHlth DESC
LIMIT 10;

