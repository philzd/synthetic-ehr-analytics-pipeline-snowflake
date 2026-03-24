USE DATABASE ehr_demo;
USE SCHEMA analytics;

-- Null primary key check.
SELECT COUNT(*) AS null_patient_ids
FROM patients_clean
WHERE patient_id IS NULL;

-- Duplicate primary check.
SELECT
    patient_id,
    COUNT(*) AS duplicate_count
FROM patients_clean
GROUP BY patient_id
HAVING COUNT(*) > 1;

-- Referential integrity check.
SELECT COUNT(*) AS orphan_encounters
FROM encounters_clean e
LEFT JOIN patients_clean p
    ON e.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

-- Temporal validation.
SELECT COUNT(*) AS invalid_time_ranges
FROM encounters_clean
WHERE end_ts < start_ts;
