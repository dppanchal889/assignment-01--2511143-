## Storage Systems

In this design, I used multiple storage systems because the hospital network has different goals and each goal needs a different type of data handling. For predicting patient readmission risk, I would use both a data lake and a data warehouse. The data lake stores raw historical treatment data, lab records, prescriptions, discharge summaries, and other source data in its original form. This is useful because machine learning models usually need large volumes of raw and detailed historical data. The data warehouse stores cleaned and structured versions of important data so analysts and data scientists can use it more easily for model training and reporting.

For doctors who want to query patient history in plain English, I would use a vector database. Clinical notes, discharge summaries, diagnosis descriptions, and other text-based patient records can be converted into embeddings and stored in the vector database. This allows semantic search, which means the system can find information by meaning rather than exact words.

For monthly hospital reports such as bed occupancy, department costs, and utilization trends, I would use a data warehouse. A warehouse is the best option for reporting because the data is structured, cleaned, and organized for fast analytical queries.

For real-time ICU vitals, I would use a streaming pipeline together with a time-series database. ICU devices generate continuous measurements such as heart rate, oxygen saturation, and blood pressure. A time-series database is well suited for storing and querying this kind of time-based data efficiently.

## OLTP vs OLAP Boundary

In this design, the OLTP boundary ends at the operational hospital systems. These systems include patient registration, appointments, treatment updates, doctor entries, and billing transactions. They are used for day-to-day hospital work and need fast, reliable transaction processing.

The OLAP boundary begins when data is extracted from these operational systems and moved into analytical storage such as the data warehouse, data lake, vector database, or time-series environment used for broader analysis. After that point, the data is no longer mainly used for transactions but for reporting, dashboards, machine learning, and semantic search. In simple terms, OLTP supports hospital operations, while OLAP supports insight generation and decision-making.

## Trade-offs

One major trade-off in this design is complexity. Using separate systems such as a warehouse, lake, vector database, and time-series database gives better performance for different use cases, but it also increases maintenance, integration effort, and governance complexity. Data must move correctly between systems, and teams must manage more pipelines and storage technologies.

To reduce this risk, I would define clear responsibilities for each system. The operational database would handle transactions, the warehouse would handle reporting, the vector database would handle semantic search, and the time-series database would handle ICU telemetry. I would also use monitored ETL and streaming pipelines, strong data quality checks, and consistent metadata rules. This would help control the complexity while still keeping the advantages of a multi-system design.