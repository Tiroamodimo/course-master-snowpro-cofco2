# Corrections for Prep Exam Take 1: 2024-02-13

Here are the results of my first take

<img src="../../resources/readme_images/exam_prep_take20240212_01_corrections/take01aa_overview.png">

## Section 08: Account and Security

1. **Assigning a network policy** on the user level needs a **role**:
   1. with **OWNERSHIP** privileges on **user**
   1. with **OWNERSHIP** privileges on **network policy**
1. Rekeying requires:
   1. to be enabled
   1. Enterprise edition accounts and above.
1. Rekyeing will:
   1. destroy retired keys that are older than a year.
   1. Create a new encryption key and the data will be re-encrypted.
1. Key rotation will:
   1. make sure that a key is only active (i.e. it is used to encrypt new data) for 30 days
1. Multi-factor authentication (MFA)
   1. is available in all editions
   1. MFA token caching needs to be enabled first
   1. MFA token caching is available for Connector for Python, JDBC driver, and ODBC driver.
   1. It is strongly recommended to use MFA for users with the ACCOUNTADMIN role.
   1. MFA is fully supported by Snowsight, SnowSaL, JDBC, ODBC, and Python Connector.
1. **Network Policies** can be created by:
   1. users with **SECURITYADMIN** role
   1. users assigned roles with **CREATE NETWORK POLICY** privileges
1. About Federated Authentication
   1. A **federated environment** consists of:
      1. Service Provider, i.e Snowflake
      1. External Identity Provider (IdP), i.e Okta or AD FS
   1. **Assigning a network policy** on the user level needs a **role**:
   1. with **OWNERSHIP** privileges on **user**
   1. with **OWNERSHIP** privileges on **network policy**
1. Rekeying requires:
   1. to be enabled
   1. Enterprise edition accounts and above.
1. Rekyeing will:
   1. destroy retired keys that are older than a year.
   1. Create a new encryption key and the data will be re-encrypted.
1. Key rotation will:
   1. make sure that a key is only active (i.e. it is used to encrypt new data) for 30 days
1. Multi-factor authentication (MFA)
   1. is available in all editions
   1. MFA token caching needs to be enabled first
   1. MFA token caching is available for Connector for Python, JDBC driver, and ODBC driver.
   1. It is strongly recommended to use MFA for users with the ACCOUNTADMIN role.
   1. MFA is fully supported by Snowsight, SnowSaL, JDBC, ODBC, and Python Connector.
1. **Network Policies** can be created by:
   1. users with **SECURITYADMIN** role
   1. users assigned roles with **CREATE NETWORK POLICY** privileges
1. About Federated Authentication
   1. A **federated environment** consists of:
      1. Service Provider, i.e Snowflake
      1. External Identity Provider (IdP), i.e Okta or AD FS
   1. Snowflake is compatible with SCIM 2.0.
   1. There is native support for Okta and AD FS.
   1. Most SAML 2.0-compliant venders are supported
1. The **INFORMATION_SCHEMA**:
   1. Querying table functions in the INFORMATION_SCHEMA can give different results depending on the privileges of the role that executes the query.
   1. The INFORMATION_SCHEMA contains:
      1. database level information
      1. account-level information. 
   1. The ACCOUNT_USAGE_SCHEMA has a latency of between 45 minutes and 3 hours.
   1. The INFORMATION_SCHEMA has a retention period of between 7 days and 6 months and doesn't contain dropped objects.
1. Snowflake Release Process per Edition
   1. Standard edition accounts can get access to new releases on the first or second day. So, some account can get access on the first day.
   1. Enterprise edition accounts will only get access to releases on the first day if they have requested Early-Access.
   1. Business Critical edition accounts will always get access on the second day of the release.
1. About Privileges and Roles
   1. One object can only have one owner. 
   1. Privileges can be only granted to roles.
   1. Roles can also be granted to other roles.
   1. MODIFY privileges allow to alter properties such as resizing the warehouse.
1. About Data Encryption
   1. Data at rest encrypted with AES 256-bit encryption
   1. Data in transit encrypted with TLS 1.2 encryption
1. The **INFORMATION_SCHEMA**:
   1. Querying table functions in the INFORMATION_SCHEMA can give different results depending on the privileges of the role that executes the query.
   1. The INFORMATION_SCHEMA contains:
      1. database level information
      1. account-level information. 
   1. The ACCOUNT_USAGE_SCHEMA has a latency of between 45 minutes and 3 hours.
   1. The INFORMATION_SCHEMA has a retention period of between 7 days and 6 months and doesn't contain dropped objects.
1. Snowflake Release Process per Edition
   1. Standard edition accounts can get access to new releases on the first or second day. So, some account can get access on the first day.
   1. Enterprise edition accounts will only get access to releases on the first day if they have requested Early-Access.
   1. Business Critical edition accounts will always get access on the second day of the release.
1. About Users, Roles and Privileges
   1. One object can only have one owner. 
   1. Privileges can be only granted to roles.
   1. Roles can also be granted to other roles.
   1. MODIFY privileges allow to alter properties such as resizing the warehouse.
   1. Multiple roles can be granted to a single user.
   1. Privileges can be granted to system-defined roles but not revoked.
   1. The ACCOUNTADMIN role is the top-level role. This role inherits all privileges from the other system-defined roles.
1. About Data Encryption
   1. Data at rest encrypted with AES 256-bit encryption
   1. Data in transit encrypted with TLS 1.2 encryption
1. Key Pair Authentication
   1. There can be one or two public keys as part of a key pair.
1. Column-level Security
   1. External tokenization removes sensitive data by replacing each value with a cryptic token.
   2. Like this it is possible to group data and preserve some analytical value of the column without revealing sensitive information.

## Section 4: Data Transformation
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
   


## Section 02: Architecture
1. There is no "Serverless" Layer, [see this](../Section02_Snowflake_Architechture/notes_section02part01)
1. It is important to understand Pricing, [see this](../../Section02_Snowflake_Architechture/README.md)
1. 