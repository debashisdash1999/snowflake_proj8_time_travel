# snowflake_proj8_time_travel
This project demonstrates the use of Snowflake’s Time Travel feature, which allows retrieving historical data either by timestamp offset or using query IDs.

TASK 1: Exploring Time Travel
Create database and table (sales_db_time_travel.time_travel_table)
Insert initial product data
Update records to simulate changes
Query data from 1 minute ago using OFFSET
Drop the table and database for cleanup

TASK 2: Exploring Time Travel with Data Retention & Query ID
Create a database and table (time_travel_db.retention_table) with DATA_RETENTION_TIME_IN_DAYS = 1
Insert sample order records
Update a record’s amount
Retrieve the query_id of the update using LAST_QUERY_ID()
Query the table before the update using BEFORE (STATEMENT => query_id)

Real-World Relevance of Snowflake Time Travel:
Accidental Data Recovery – Restore dropped tables or records without relying on external backups.
Audit & Compliance – Query historical states of data to meet audit and regulatory requirements.
Error Correction – Roll back to a consistent snapshot after faulty updates or deletes.
Debugging & Testing – Compare data before and after changes to identify issues in ETL pipelines.
Business Continuity – Ensure data availability during errors.
Change Tracking – Analyze how data evolved over time without maintaining manual versioning.
