# Section 2 - Part 1: Multi-cluster shared disk and three distinct layers

## Snowflake Architecture: Managing Storage and Compute

- Storage and computation are limited resources
- 2 major approaches emerged as ways of solving problems related to limited storage and computation
    <img src="../resources/readme_images/section02a_traditional_architectures.png" width="300" height="150">
- Snowflake's Solution is a hybrid these traditional approaches
    <img src="../resources/readme_images/section02b_snowflake_architecture_ito_traditional_archtectures.png" width="300" height="150">

## Snowflake Architecture: Three Distinct Layers

- Snowflake's architecture is comprised of 3 distinct layers. Namely:
  1. Database Storage Layer
  2. Query Processing (Compute) Layer
  3. Cloud Services Layer

    <img src="../resources/readme_images/section02c_snowflake_architecture_layers.png" width="300" height="150">

- The Storage Layer is where the data is stored

    <img src="../resources/readme_images/section02d_snowflake_architcture_storage_layer.png" width="300" height="150">
  
- The query processing layer is where virtual machines [warehouses] perform necessary computation to execute queries

    <img src="../resources/readme_images/section02e_snowflake_architecture_query_processing_layer.png" width="300" height="150">

- The cloud services layer coordinates the other layers together in a secure, transparent and cost-effective way for users

    <img src="../resources/readme_images/section02f_snowflake_architecture_cloud_services_layer.png" width="300" height="150">
