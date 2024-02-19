# Section 9 Corrections: Performance Concepts

1. Storage Strategy
   - Data is stored in micro-partitions, in a compressed and columnar format.

1. One micro-partition contains about 50 - 500 MB (uncompressed) of data. Since the data is actually compressed the actual size is smaller.

1. The metadata cache can return the following results without the use a virtual warehouse:
   - Row `Count` in a table.
   - `MIN`/`MAX` value of a column (limited to **INT**, **NUMBER**, and **DATE**)
   - Number of `DISTINCT` values in a column
   - Number of `NULL` values in a column
   - `SHOW` / `DESC` commands

1. About Materialised Views:
   - What is true about them?
     - cause additional costs in the **Storage layer** because the data is physically stored.
     - consume resources (Serverless resource costs in **Cloud Services Layer**) because of the automatic background process that prevents materialized views from being out-of-date in case updates on the underlying tables occur.
     - they benefit significantly for **frequently run** queries that are **sufficiently complex**.
   - What is false about them?
     - they benefit significantly from using selective filtering (NB! Search Options do though)
     - They benefit significatly high data volumes benefit
       - this is becuse physically stored high data volumes increase costs

1. About Data Spilling
   - Cause: Data spilling occurs when intermediate results don't fit into the memory of the warehouse
   - Recommended Solutions:
     1. process data in smaller portions
     1. user larger warehouse

1. About Search Optimization Service:
   - Search Optimization Service can cause additional costs in the **Storage layer** because a search access path is created and that requires physical data storage.
   - Search Optimization Service consumes resources (Serverless resource costs in **Cloud Services Layer**) for the initial setup as well as for the ongoing maintenance of the service.

1. About Clustering (Indexing - more classical term)
   - What is true
     -  NB!: Clustering keys are not for every table since they **cause additional costs** we should **thoughtfully choose tables that benefit** from a clustering key.
     - A **clustering key can be added to** an expression like casting a timestamp **to date.** This can be useful to **decrease the cardinalit**y of a very granular column **and reduce the overhead** and with that the cost of reclustering.
     - Clustering keys can be defined on a single or on **multiple columns**. As a best practice, **we should define them from low to high cardinality**. If the order is high cardinality and then low cardinality the second column (low cardinality) may not benefit from the clustering keys as much as it could.
     - **New rows will be inserted into new micro-partition** just in the order they are inserted. **As micro-partitions are immutable**, nothing can be changed and period re-clustering **needs to re-create new micro-partitions periodically**.
     - columns in used frequently in the following clauses benefit:
       - `WHERE`
       - `JOIN`
   - What is false:
     - ideal for clustering columns **frequently** used in **aggregations**
     - ideal for very **high cardinality** columns
   - Clustering Information
     - `SYSTEM$CLUSTERING_INFORMATION`
       - Returns detailed clustering information according to the specified column including average overlap, average depth, and a partition depth histogram.
     - `SYSTEM$CLUSTERING_DEPTH`
       - Returns the average depth of a table according to the specified column.