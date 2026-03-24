USE DATABASE ehr_demo;
USE SCHEMA analytics;

CREATE OR REPLACE TABLE patient_summary AS
SELECT
    p.patient_id,
    p.birth_date,
    p.gender,
    p.race,
    p.ethnicity,
    COUNT(e.encounter_id) AS encounter_count,
    MIN(e.start_ts) AS first_encounter_ts,
    MAX(e.start_ts) AS last_encounter_ts
FROM patients_clean p
LEFT JOIN encounters_clean e
    ON p.patient_id = e.patient_id
GROUP BY
    p.patient_id,
    p.birth_date,
    p.gender,
    p.race,
    p.ethnicity;
