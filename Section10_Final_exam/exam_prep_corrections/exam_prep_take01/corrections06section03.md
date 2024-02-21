# Section 3 Corrections: Data Loading and Unloading

1. About Stages in General:
   - What's true about them:
     - `LIST` is used to list all the files in a stage
       - named stages referred by `@stage_name`, result: `LIST @stage_name`
       - table stages referred by `@%stage_name`, result: `LIST @%stage_name`
       - user stages referred by `@~stage_name`, result: `LIST @~stage_name`
     - You can use the `FILES` parameter in a `COPY INTO` statement to load only one or multiple specific files. [see here](../../../resources/readme_images/section03_data_loading_and_unloading/part02_copy_into/section03part02c_data_loading_unloading_copyinto_sourcing_methods.png)
     - there are 3 types of internal stages [see here](../../../resources/readme_images/section03_data_loading_and_unloading/part01_managing_stages/section03part01d_data_loading_unloading_stages_workflow_downloading.png)

1. About Internal Stages
   - What is true about them
     - Data files uploaded to an internal stage in Snowflake are automatically compressed and encrypted. 
     - A table stage is associated with a specific table and cannot access other tables in a database.
     - Data in an internal stage will persist until it is explicitly deleted by the user.
     - Data files uploaded to an internal stage in Snowflake are automatically compressed and encrypted.
     - A table stage is associated with a specific table and cannot access other tables in a database.
     - Data in an internal stage will persist until it is explicitly deleted by the user.
   - What is false about them
     - A table stage can access other tables
     - unused data is purged after a specified period

1. About Snowpipe:
    - What is true about it?:
    - By using Snowpipe data can be loaded as soon as they appear in a stage.
      - Near real time loading from cloud blog storage
        - You need to set up a notification event that will be used in the pipe to trigger the load.
   - What is false about it?
     - it uses AWS Lambda to trigger a pipe that loads new files from the S3 bucket into the table.
     - Snowpipe will automatically detect new files in a specified stage without any other object.
     - you can set up a task that automatically executes a serverless load from the S3 bucket.
     - uses AWS Glue to create a crawler and ETL job that automatically detects and loads new files from the S3 bucket into the table.

1. About `VALIDATION_MODE` parameter
   - what is true about it?
     - `COPY` command parameter
     - it is used to validate the data files instead of loading them

1. About `ON_ERROR` parameter
   - what is true about it?
     - the default action is `ABORT_STATEMENT`, [see here](../../../resources/readme_images/section03_data_loading_and_unloading/part05_copyoptions/section03part05e_data_loading_unloading_copyoptions_params_on_error.png)



- [<- previous](README.md)