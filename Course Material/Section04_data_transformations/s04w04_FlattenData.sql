// Flattening data

SELECT * FROM TABLE(FLATTEN(input => [2,4,6])) f;


SELECT 
    RAW_FILE:id::int as id,  
    RAW_FILE:first_name::STRING as first_name,
    VALUE::STRING as prev_company
FROM OUR_FIRST_DB.PUBLIC.JSON_RAW
,TABLE(flatten ( input => RAW_FILE:prev_company ));