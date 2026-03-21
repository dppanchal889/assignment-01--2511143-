## Storage Systems

In this design, I used different storage systems because the hospital has different types of data and different goals.

For predicting patient readmission risk, I would use a data lake and a data warehouse. The data lake can store raw historical data such as treatment records, prescriptions, lab reports, and discharge summaries. The data warehouse can store cleaned and structured data for analysis and model training. This is useful because machine learning needs a lot of past data.

For doctors asking questions in plain English, I would use a vector database. Patient history, doctor notes, discharge summaries, and diagnosis text can be converted into embeddings and stored there. This helps the system find information based on meaning, not only exact words.

For monthly reports such as bed occupancy and department costs, I would use a data warehouse. A warehouse is a good choice because reporting works better with structured and organized data.

For real-time ICU vitals, I would use a streaming pipeline and a time-series database. ICU devices send data continuously, so this type of database is better for values such as heart rate, oxygen level, and blood pressure.

## OLTP vs OLAP Boundary

In my design, the OLTP part is the operational hospital system. This includes patient registration, appointments, treatment updates, billing, and doctor entries. It is used for daily hospital work and fast transactions.

The OLAP part begins when data is moved from the operational systems into the data lake, data warehouse, vector database, or time-series system for analysis. After that, the data is used for reporting, dashboards, machine learning, and search. So, OLTP is for daily hospital work, while OLAP is for analysis and decision-making.

## Trade-offs

One important trade-off in this design is complexity. Using multiple storage systems gives better performance for different tasks, but it also makes the system harder to manage. Data has to move between the operational database, warehouse, vector database, and time-series database.

To reduce this problem, I would use clear data pipelines and simple rules for what each system should store. I would also use monitoring and data quality checks to make sure the data moves correctly. This will help keep the system reliable and organized.