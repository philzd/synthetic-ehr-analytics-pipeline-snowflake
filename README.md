# Synthetic EHR Analytics Pipeline (Snowflake)

![SQL](https://img.shields.io/badge/sql-data--engineering-blue)
![Snowflake](https://img.shields.io/badge/snowflake-data--warehouse-lightblue)

A lightweight analytics pipeline that transforms synthetic healthcare (EHR) data into validated, analytics-ready datasets using SQL in Snowflake.

----------

## TL;DR

This project implements a Snowflake-based SQL pipeline for transforming synthetic electronic health record (EHR) data into structured, analytics-ready tables.

```text
Raw tables
(patients, encounters)
↓
Cleaned tables
(schema standardization)
↓
Patient summary
(aggregated analytics table)
↓
Validation queries
(data quality checks)
```

The goal is to model how Snowflake is used as a data warehouse for SQL-based transformations and analytics.

----------

## Overview

This project demonstrates a simplified Snowflake analytics workflow:

- Load raw EHR data into Snowflake tables
- Transform raw tables into cleaned, structured datasets using SQL
- Build analytics-ready summary tables
- Validate data quality using SQL checks

The pipeline is implemented entirely in SQL and reflects common warehouse-style transformations.

----------

## Source Data

Data is generated using [Synthea](https://synthea.mitre.org/), an open-source synthetic patient generator.

Tables used:

- `patients`
- `encounters`

The dataset contains no real patient information and is safe for public use.

----------

## Architecture

### Raw Layer

- Source tables loaded into Snowflake:
  - `patients_raw`
  - `encounters_raw`

Represents raw ingested data prior to transformation.

### Clean Layer

- Standardized and structured tables:
  - `patients_clean`
  - `encounters_clean`

Transformations include:

- Column renaming (consistent naming conventions)
- Selection of relevant fields
- Simplified schema for analytics use

### Analytics Layer

Built a patient-level summary table:

- `encounter_count`
- `first_encounter_ts`
- `last_encounter_ts`

Output:

- `patient_summary`

----------

## Data Quality Checks

Implemented SQL-based validation logic to ensure data integrity.

- Referential integrity:
  - All encounters map to valid patients
- Duplicate detection:
  - No duplicate primary keys in cleaned tables
- Null checks:
  - Required fields are not missing
- Temporal validation:
  - Encounter end time ≥ start time

These checks simulate production data validation workflows in analytics pipelines.

----------

## Example Queries

Example aggregation:

```sql
SELECT
    patient_id,
    COUNT(*) AS encounter_count
FROM encounters_clean
GROUP BY patient_id
ORDER BY encounter_count DESC;
```

----------

## Tech Stack

- Snowflake
- SQL

----------

## Key Concepts Demonstrated

- SQL-based data transformations
- Data modeling in a warehouse environment
- Analytical table design (aggregations, joins)
- Data validation and integrity checks
- Healthcare analytics pipeline patterns

----------

## Project Structure

```text
sql/
├── 01_setup.sql
├── 02_clean_tables.sql
├── 03_patient_summary.sql
├── 04_validation.sql
```

----------

## How to Run

1. Create Snowflake database and schemas
2. Load source data into raw tables (`patients_raw`, `encounters_raw`)
3. Run SQL scripts in order:

  - `01_setup.sql`
  - `02_clean_tables.sql`
  - `03_patient_summary.sql`
  - `04_validation.sql`

3. Query outputs in the analytics schema

----------

## Relationship to Databricks Pipeline

This project is a SQL-based adaptation of a PySpark ETL pipeline implemented in Databricks.

- Databricks version: distributed ETL and processing
- Snowflake version: warehouse-based transformations and analytics

Together, they demonstrate complementary roles in modern data platforms.

----------

## Usage Notice

This repository is shared for portfolio and evaluation purposes.

Please contact the author for permission before reusing or redistributing the code.

----------

## Author

Philippe Do
