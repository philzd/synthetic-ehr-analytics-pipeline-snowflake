USE DATABASE ehr_demo;
USE SCHEMA analytics;

USE DATABASE ehr_demo;
USE SCHEMA analytics;

CREATE OR REPLACE TABLE patients_clean AS
SELECT
    Id AS patient_id,
    BIRTHDATE AS birth_date,
    DEATHDATE AS death_date,
    GENDER AS gender,
    RACE AS race,
    ETHNICITY AS ethnicity,
    CITY AS city,
    STATE AS state,
    COUNTY AS county,
    ZIP AS zip
FROM ehr_demo.raw.patients_raw;

CREATE OR REPLACE TABLE encounters_clean AS
SELECT
    Id AS encounter_id,
    PATIENT AS patient_id,
    ORGANIZATION AS organization_id,
    ENCOUNTERCLASS AS encounter_class,
    START AS start_ts,
    STOP AS end_ts,
    PAYER_COVERAGE AS payer_coverage,
    REASONCODE AS reason_code,
    REASONDESCRIPTION AS reason_description
FROM ehr_demo.raw.encounters_raw;
