## Storage Systems

In this design, I used different storage systems because the hospital has different kinds of work.

For predicting patient readmission risk, I would use a data lake and a data warehouse. The data lake can keep raw historical treatment data, and the data warehouse can keep cleaned data for analysis. This is useful because machine learning needs a lot of past data.

For doctors asking questions in plain English, I would use a vector database. Patient history, doctor notes, and discharge summaries can be converted into embeddings and stored there. This helps the system find similar meaning, not only exact words.

For monthly reports such as bed occupancy and department costs, I would use a data warehouse. This is a good choice because reporting works better on structured and organized data.

For real-time ICU vitals, I would use a streaming system and a time-series database. ICU devices send data continuously, so this type of storage is better for time-based data like heart rate, oxygen level, and blood pressure.

## OLTP vs OLAP Boundary

In my design, the OLTP part is the operational hospital system. This includes patient registration, treatment updates, billing, and doctor entries. It is used for daily work and fast transactions.

The OLAP part starts when data is moved from the operational systems into the data warehouse or data lake. After that, the data is used for reporting, dashboards, analytics, and machine learning. So, OLTP is for day-to-day hospital activities, and OLAP is for analysis.

## Trade-offs

One important trade-off in this design is that using many storage systems makes the architecture better, but also more complex. For example, data has to move between different systems like the operational database, warehouse, vector database, and time-series database.

To reduce this problem, I would use clear data pipelines and simple rules about which system stores what type of data. I would also use monitoring to check whether the data is moving correctly. This will help keep the system more organized and reliable.