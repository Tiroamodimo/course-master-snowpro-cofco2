## Section 02 Corrections: Architecture

1. About Snowflake's compute and memory configuration
   - Snowflake's architecture is best described with multi-cluster shared data architecture which combines the benefits of shared-disk and shared-nothing architecture.
   - Warehouses have their own CPU, memory, and local data cache but they can all access a central data repositor.
   - [see this](../../../Section02_Snowflake_Architechture/notes_section02part01.md)

1. About the Layered Architecture:
   1. The Cloud Services Layer ties together all the different components in Snowflake and manages among others, authentication, infrastructure, metadata, query parsing and optimization, and access control. [See this](../../../Section02_Snowflake_Architechture/notes_section02part01.md)
   1. There is no "Serverless" Layer, [see this](../../../Section02_Snowflake_Architechture/notes_section02part01.md)

1. About Snowflake Editions:
   1. They have different features. [see this](../../../resources/readme_images/section02_architecture/part02_editions/section02part02b_snowflake_architecture_edition_features.png)
   1. **Resource monitors** supported from **Standard Edition**. [see this](../../../resources/readme_images/section02_architecture/part04_monitoring/section02part04f_snowflake_architecture_resource_monitors_cloud_services.png)
   1. 

1. About Billing
   - It is important to understand Pricing, [see this](../../../Section02_Snowflake_Architechture/README.md)
   - If your warehouse is active for less than 60 seconds, you'll still be charged for 60 seconds
   - If your warehouse is active for more than 60 seconds, you'll be charged for the exact number of seconds it's active, rounded up to the nearest second.
   - A warehouse only causes cost when it is started but it can be started (i.e. not suspended) and still not execute any queries. In this case, it still causes credit consumption.
   - Billing Scenarios:
     1. small warehouses runs for 43 sec:
        - warehouse costs 2 credits per hour, we are charged for 1 minute.
        - Snowflake bill: 2 * 1/60 credits = 2/60 compute cost.
     1. How many seconds are we charged if warehouse active for 2min 46seconds?
        - Since warehouse is running long than 60 seconds, 120 [2min] + 46 seconds = 166 seconds
     1. if a warehouse is started, but does not execute a query and set to auto_suspend after 1 min, how many seconds are we charged?
        - since the warehouse is started and suspended after 60 seconds [1min],
        - Snowflake charge: 60 seconds.

1. The cost per credit depends on:
   1. the region
   1. the cloud provider that the account is based on
   1. plus the edition of the account.
   - see [this](../../../resources/readme_images/section02_architecture/part03_pricing/section02part03e_snowflake_architecture_pricing_credit_cost_situation1.png) and [this](../../../resources/readme_images/section02_architecture/part03_pricing/section02part03f_snowflake_architecture_pricing_credit_cost_situation2.png).

1. About Snowsql
   - SnowSQL can be installed on:
      1. Windows
      1. Linux
      1. MacOS
   - SnowSQL is the command line client that can be used to connect to Snowflake. It can be used to execute SQL queries and perform all DDL and DML operations, including data loading and data unloading.
   - [see this](../../../resources/readme_images/section02_architecture/part06_objects_and_snowsql/section02part06b_snowflake_architecture_snowsql_overview.png)

1. About Multicluster Warehouse:
   - Scaling Policies:
     - Types:
       - Economy Scaling
       - Standard Scaling
     - About Economy Scaling:
       - starts adding warehouses to the cluster when current workload is estimated to run at least **6 min**.
     - About Standard Scaling:
       - [add here]
     - What is **FALSE** about them
       - "Performance" is a scaling policy
       - "Snowpark-optimise" is a scaling policy
         - NB!!! this is a type of warehouse, [see this](../../../resources/readme_images/section02_architecture/part05_warehouses_and_multiclustering/section02part05b_snowflake_architecture_warehouses_types.png)
       - 
- About Resource Monitors:
  - There are 3 possible actions:
    1. Notify: The warehouse will continue.
    1. Notify and Suspend: The warehouse will complete all running workloads.
    1. Notify and Suspend immediately: All running queries will be aborted and the warehouse suspended immediately.
    - [see this](../../../resources/readme_images/section02_architecture/part04_monitoring/section02part04e_snowflake_architecture_resource_monitors_quota_triggered_actions.png)

[<- previous](README.md)