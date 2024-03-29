-- Use ACCOUNTADMIN role
USE ROLE ACCOUNTADMIN;

-- Create a database from the share.
CREATE DATABASE SNOWFLAKE_SAMPLE_DATA_2 FROM SHARE SFC_SAMPLES.SAMPLE_DATA;

-- Grant the PUBLIC role access to the database.
-- Optionally change the role name to restrict access to a subset of users.
GRANT IMPORTED PRIVILEGES ON DATABASE SNOWFLAKE_SAMPLE_DATA_2 TO ROLE PUBLIC;