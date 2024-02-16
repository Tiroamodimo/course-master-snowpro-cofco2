## Section 4 Corrections: Data Transformation

1. `json` `VARIANT` data elements below,
   
   ```json
   {
     "courses": {
       "snowflake": {
         "module1": {
           "topic": "Introduction",
           "difficulty": "All levels"
         }
       },
       "azure": {
         "modulel": {
           "topic": "Introduction",
           "formats": [
             "video lectures",
             "hands-on",
             "quizzes"
           ]
         }
       }
     }
   }
   ```
   can be parsed in one of the following ways:
   ```snowflake
   select $1:courses.azure.module1.format[1]
   ```
   or
   ```snowflake
   select <column_name>:courses.azure.module1.format[1]
   ```
1. About Directory Tables:
   1. syntax:
   ```snowflake
   SELECT * FROM DIRECTORY(@stage_name)
   ```
   1. What's true about them
      - A directory table is **not a separate database object**, it is more like an **implicit object layered** on a stage.
      - They need **to be enabled**
        - A directory table needs to be enabled for a stage by setting the parameter DIRECTORY =
(ENABLE = TRUE) in a given stage.
      ```snowflake
      [show example here]
      ```
      - can retrieve file URLs
   1. What's false about them
1. About stored procedures:
   - What's true about them
     - generally perform admin operations
     - can make use of user information such as session variables
     - can extend system functionality with procedural code 
   
   - What's false about them
     - They require owner's privilege
     - They need to return a value

1. About Size Limits
   - maximum `VARIANT` length is **16MB**

1. About UDFs
   - Supported Languages:
     - SQL
     - Java
     - JavaScript
     - Python
   - About Secure UDFs
     - they hide definition from unauthorised users
     - bypass certain optimisations which can **reduce performance**
     - can **ONLY** be created by:
       1. `SECUREADMIN` role users
       1. `ACCOUNTADMIN` role users

1. About Sequences
   - What is True about them
      - It's a schema level object
      - "A sequence is used to generate numbers. This can be used for example to generate values for a primary key in a table" - Nikolai
      - the default start value is `1`.
      - the default increment is `1`
   - What is False about them
     - They are guaranteed to be gap-free

1. About Transformations during loading
   - Supported Transformations
     - casting data types
     - column reordering
     - column omitting
     - Some SQL Functions, [see here](https://docs.snowflake.com/en/user-guide/data-load-transform)
   - NOT Supported Transformations
     - `GR0UP BY`
     - `FLATTEN`
     - `WHERE`
     - `JOIN`s

1. About External Functions
   - What's True about them
     - They can be **executed outside Snowflake**
   - What's False about them
     - can be executed in Snowflake's scalable compute engine
     - can be executed in a location set in the configuration

1. About Sourcing and Sharing Stages
    - `BUILD_SCOPED_FILE_URL`
      - Returns a Scoped URL. This URL is suitable to provide access to specific roles in the same account or for roles in other accounts via data sharing.
    - `BUILD_STAGE_FILE_URL`
      - Returns a File URL. This is a permanent URL that can provide prolonged access to a file when sent along with an authorization token.
    - `GET_PRESIGNED_URL`
      - Returns a Pre-signed URL that makes the files accessible openly via browser. There is no need for a token or authentication to Snowflake.
    - `GET_STAGE_LOCATION`
      - Returns the URL for an external or internal named stage.

[<- previous](README.md)