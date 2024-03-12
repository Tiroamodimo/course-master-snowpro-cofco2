// Clone objects
CREATE DATABASE MANAGE_DB_CLONE
CLONE MANAGE_DB;

DROP DATABASE MANAGE_DB_CLONE;





// Cloning using time travel

// Setting up table

CREATE OR REPLACE TABLE OUR_FIRST_DB.public.customers (
   id int,
   first_name string,
  last_name string,
  email string,
  gender string,
  Job string,
  Phone string);
    


CREATE OR REPLACE FILE FORMAT MANAGE_DB.file_formats.csv_file
    type = csv
    field_delimiter = ','
    skip_header = 1;
    
CREATE OR REPLACE STAGE MANAGE_DB.external_stages.time_travel_stage
    URL = 's3://data-snowflake-fundamentals/time-travel/'
    file_format = MANAGE_DB.file_formats.csv_file;
    


LIST @MANAGE_DB.external_stages.time_travel_stage;



COPY INTO OUR_FIRST_DB.public.customers
from @MANAGE_DB.external_stages.time_travel_stage
files = ('customers.csv');


SELECT * FROM OUR_FIRST_DB.public.customers;



// Update data 

UPDATE OUR_FIRST_DB.public.customers
SET FIRST_NAME = 'Frank' ;




// Using time travel
CREATE OR REPLACE TABLE OUR_FIRST_DB.PUBLIC.CUSTOMERS_CLONE
CLONE OUR_FIRST_DB.public.customers AT (OFFSET => -60*1.0);

SELECT * FROM OUR_FIRST_DB.PUBLIC.CUSTOMERS_CLONE


// Update data again

UPDATE OUR_FIRST_DB.public.CUSTOMERS_CLONE
SET JOB = 'Snowflake Analyst' ;

SELECT * FROM OUR_FIRST_DB.PUBLIC.CUSTOMERS
