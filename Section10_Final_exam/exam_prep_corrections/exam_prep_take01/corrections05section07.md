# Section 7 Corrections: Zero-copy Cloning and Sharing

1. About Direct Sharing:
    - what is true about it?
      - consumer charged for compute resources to query to data
      - No actual data is copied
    - what is false about it?
      - data is physically replicated to the other account
      - data will be transferred to the other account
      - consumer will be charged to store the data

1. About data sharing?
   - What is true about it?
     - There can be only one shared database
     - external tables can be shared
     - creating and managing shares:
       - By default, `ACCOUNTADMIN` role.
       - can be delegated to other roles with `grant CREATE SHARE privileges`
       - NB! only roles are given permissions to shares
     - There is a share:
       - A share is the mechanism used to grant access to a specific set of Snowflake database objects (like tables, views, schemas) to other accounts. It acts as a container for the shared data.
       - Data providers create shares, specifying which objects to share and the level of access (e.g., read-only).
       - Data consumers import these shares, gaining access to the shared data within their own accounts.
       - Shares are secure, controlled by access policies, and offer various configuration options like row-level security or dynamic data masking.
     - There is a shared database:
       - A shared database is the actual database object that gets shared through a share. It exists in the data provider's account and remains physically unchanged upon sharing.
       - When a consumer imports a share containing a shared database, a virtual copy of the database is created in their account. This virtual copy provides read-only access to the data, preserving the original database in the provider's account.
       - Consumers can query and analyze the data in the virtual copy as if it were their own, but they cannot modify or delete it.
     - If a new object is created in a shared database it has to be first added to the share. If an object is added to a share by adding the relevant privileges it will be immediately available to the consumer - meaning there are no further actions required by the consumer.
     - There can be only one database added to a share. But data can be shared from multiple databases by using secure views.
     - If a secure view is shared that references other databases you must additionally `grant REFERENCE_USAGE privileges on the referenced databases` (not on the shared database itself).
     - When data is updated in a shared database by the provider, it immediately becomes visible to the consumer because by sharing we just make the share data available without creating any independent copies.
     - Privileges will be defined in a share. This includes the containers (i.e. database and schemas) as well as the shared objects (e.g. tables and secure views).
       - The following objects can be shared:
         - Tables
         - External tables
         - Secure views
         - Secure materialized views
         - Secure UDFs
       - The follow can also form part of a share:
         - Privileges of an object
         - Account Identifiers
   - What is false about it?
     - A new schema in a database is immediately available in the consumer account
     - Data can only be shared with other snowflake users
     - A share has an expiration time
     - Users get access to shares

1. About Cloning
    - What is true about it?
    
      - It requires ORGADMIN role
      - `Database replication` must be first enabled **for source and target accounts**
        - use `SYSTEM$GLOBAL_ACCOUNT_SET_PARAMETER` function to set `ENABLE_ACCOUNT_DATABASE_REPLICATION` to `true`
      - To clone an object there are privileges on the source object needed.
        - For `tables`, it is `SELECT`
        - for `pipes`, `streams`, and `tasks` it is `OWNERSHIP`
        - and for all other objects it is `USAGE`
      - We can clone entire containers (i.e. schemas and database) and database objects directly.
      - The source objects don't inherit any privileges. So, if the table is cloned directly, no privileges will be inherited but if it is created by cloning a schema, all table privileges will be inherited.
      - Generally, metadata is cloned, therefore, clustering keys will also be available in the cloned table.
      - 

  - What is false about it?
    - `CREATE CLONE` is one of the required privileges for cloning one of the "clonable" objects
    - The cloned table will inherit the load history from the source table.
    - It is not possible to clone schemas.
    - Load history is inherited from cloning

[<- previous](README.md)

