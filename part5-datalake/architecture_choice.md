## Architecture Recommendation

I would recommend a Data Lakehouse for this fast-growing food delivery startup.

The first reason is that the startup collects many different kinds of data. GPS location logs are semi-structured, customer reviews are unstructured text, payment transactions are structured data, and restaurant menu images are unstructured image files. A traditional data warehouse is mainly designed for structured data and reporting, so it would not handle all these formats efficiently. A data lake can store all of them, but it does not always provide the same strong analytical structure and performance needed for business reporting. A data lakehouse combines the strengths of both.

The second reason is that the business needs both flexibility and analytics. The startup will likely need dashboards and reports for finance, operations, and customer behavior, which are similar to warehouse use cases. At the same time, it also needs to keep raw reviews, GPS logs, and images for machine learning, recommendation systems, and future AI features. A data lakehouse supports both raw data storage and structured analytical queries in one architecture.

The third reason is scalability. Since the company is growing quickly, the volume of orders, reviews, delivery data, and images will increase rapidly. A data lakehouse is more suitable for handling large-scale and mixed-format data while still allowing efficient querying.

Finally, a data lakehouse is a good long-term choice because it supports both current reporting needs and future advanced use cases such as fraud detection, route optimization, sentiment analysis, and image-based menu classification. For these reasons, a data lakehouse is the most practical and future-ready option.