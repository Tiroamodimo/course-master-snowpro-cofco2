-- Share the data -- 

ALTER SHARE ORDERS_SHARE 
ADD ACCOUNT = <consumer_locator>;

-- Sharing to a lower edition
ALTER SHARE ORDERS_SHARE 
ADD ACCOUNT =  <consumer_locator>
SHARE_RESTRICTIONS=false;


//// STEP 4:Create database from share ////
--- By using reader account ---

// Show all shares (consumer & producers)
SHOW SHARES;

// See details on share
DESC SHARE <consumer_account>.ORDERS_SHARE;

// Create a database in consumer account using the share
CREATE DATABASE DATA_SHARE_DB FROM SHARE <account_producer>.ORDERS_SHARE;

// Validate table access
SELECT * FROM  DATA_SHARE_DB.PUBLIC.ORDERS;


// Setup virtual warehouse
CREATE WAREHOUSE READ_WH WITH
WAREHOUSE_SIZE='X-SMALL'
AUTO_SUSPEND = 180
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE;



//// STEP 5: Grant privileges optionally

-- Create and set up users --

// Create user
CREATE USER MYRIAM PASSWORD = 'difficult_passw@ord=123';

// Grant usage on warehouse
GRANT USAGE ON WAREHOUSE READ_WH TO ROLE PUBLIC;


// Grating privileges on a Shared Database for other users
GRANT IMPORTED PRIVILEGES ON DATABASE DATA_SHARE_DB TO REOLE PUBLIC;

