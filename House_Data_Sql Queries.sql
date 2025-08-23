CREATE DATABASE HOUSE;
USE HOUSE;
CREATE TABLE house_prediction_data (
    CRIM FLOAT,
    ZN FLOAT,
    INDUS FLOAT,
    CHAS INT,
    NOX FLOAT,
    RM FLOAT,
    AGE FLOAT,
    DIS FLOAT,
    RAD INT,
    TAX FLOAT,
    PTRATIO FLOAT,
    B FLOAT,
    LSTAT FLOAT,
    MEDV FLOAT
);

select * from house_prediction_data;

## TOTAL OF HOUSE PRICES
SELECT SUM(MEDV) AS total_house_value FROM house_prediction_data;

## TOTAL TAX COLLECTED
SELECT SUM(TAX) AS total_tax FROM house_prediction_data;

## TOTAL OF ALL NUMERIC COLUMNS ##.
SELECT SUM(CRIM) AS total_crime_rate, SUM(RM) AS total_rooms, SUM(TAX) AS total_tax,
SUM(MEDV) AS total_value FROM house_prediction_data;

## Average House Price ##
SELECT AVG(MEDV) AS avg_price FROM house_prediction_data;

## AVERAGE PRICE BY ACCESS TO CHARLES RIVER ##
SELECT CHAS, AVG(MEDV) AS avg_price FROM house_prediction_data GROUP BY CHAS;

## TOP 10 HIGH-VALUE HOUSES ##
SELECT * FROM house_prediction_data ORDER BY MEDV DESC LIMIT 10;

## TOTAL COUNT BY NUMBER OF ROOMS ##
SELECT RM, COUNT(*) AS house_count FROM house_prediction_data GROUP BY RM
ORDER BY RM;

## JOIN EXAMPLE ##
CREATE TABLE crime_info (
    CRIM FLOAT,
    risk_level VARCHAR(20)
);

INSERT INTO crime_info (CRIM, risk_level)
VALUES (0.00632, 'Low'), (0.02731, 'Medium'), (0.03237, 'High');

SELECT h.CRIM, h.MEDV, c.risk_level FROM house_prediction_data h JOIN 
crime_info c ON h.CRIM = c.CRIM;

## QUERY OPTIMIZATION ##
CREATE INDEX idx_medv ON house_prediction_data(MEDV);

CREATE INDEX idx_chas ON house_prediction_data(CHAS);

SELECT AVG(MEDV) FROM house_prediction_data WHERE RM > 6;