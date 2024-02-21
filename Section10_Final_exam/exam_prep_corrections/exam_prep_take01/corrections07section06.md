# Section 6 Corrections: Continuous Protection

1. About Time Travel
    - What is true about it?
      - Time travel is supported by many objects:
        - stages
        - tables
        - views
        - streams
        - schemas
        - databases

      - Retention Period is:
          - 1 day: Standard Edition
          - 90 days: Enterprise, Business Critical and Virtual Private Editions

      - The parameter `DATA_RETENTION_TIME_IN_DAYS` can be used to set the number of days for which data is retained when performing time travel.
        - The default value is 1.
        - It is configurable on the levels:
          - accounts
          - databases
          - schemas
          - tables

      - Access method:
        - You can't directly query deleted data.
        - use the `AT | BEFORE` clause with a `SELECT` statement.
          - This specifies the point in time before the deletion where you want to access the data.
          - this clause executes based on TIMESTAMP, OFFSET (time difference), STATEMENT (query id).
        ```snowflake
        SELECT *
        FROM <table_name>
        AT | BEFORE <timestamp> | BEFORE <statement_id>;
        ```
        - Replace <table_name> with the actual table name.
        - Choose either AT <timestamp> (specific point in time) or BEFORE <statement_id> (before a specific deletion).
        - Replace <timestamp> with the desired date and time (e.g., AT '2024-02-19 17:30:00').
        - Replace <statement_id> with the unique identifier of the deletion statement (obtained from logs or audit tables).

        - What is false about it?
          - Using time travel, you can query the history of a permanently dropped table after its retention period
          - Using time travel, you can query the history the history of a materialised view


1. About Fail Safe
   - What's true about it?
     - Fail Safe is non-configurable.
     - It's a disaster recovery option after Time Travel retention has ended 
     - Temporary and Transient tables: 0 days Fail Safe.
     - Permanent tables: 7 days Fail Safe.
     - Data can only be recovered from Fail Safe by reaching out to Snowflake support.
     - Fail Safe adds to the Data Storage cost.
   - What's false about it?
     - There is 1 day of Fail Safe for Transient Tables.
     - Fail Safe is a disaster recovery method that can only recover data by contacting the **account admin**.
     - Fail Safe can be used to query data after the retention period of time travel has ended.
     - 




[<- previous](README.md)