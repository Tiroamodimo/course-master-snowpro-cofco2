Section 5 Corrections: Additional Snowflake Tools and Connectors

1. About Snow Park:
   - What's true about it?
     - Snowpark provides support for Python, Scala, and Java
   - What's false about it?
     - Spark is supported
     - Kafka is supported

1. About Snowflake Scripting
    - What is true about it
    - There is a **Snowflake Scripting Block**:
      - A section of code used to write procedural logic within Snowflake
      - Parts of a scripting block:
        - `BEGIN` and `END` are part of every block.
        - `DECLARE` can be used to optionally declare variables.
        - `EXCEPTION` can be used to optionally handle exceptions.
      - Types of scripting blocks
        - Stored procedures: Named blocks stored in the database, invoked by other scripts or SQL statements.
        - Anonymous blocks: Unnamed  blocks executed directly within a SQL statement, typically for smaller tasks.

    - It is an extension to Snowflake SQL.
    - It provides added support for procedural logic.
    - Features
      - conditional logic (CASE, IF/ELSE)
      - loops (FOR,WHILE, REPEAT, LOOP)
      - cursors
      - variables
      - resultsets.
    - Parts of a Scripting Block


- What is false about it
  - it has collections
  - it has enumerators