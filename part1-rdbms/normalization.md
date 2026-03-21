## Anomaly Analysis

### Insert Anomaly
An insert anomaly happens when we cannot add new information unless some other information is also added.

In this CSV file, product information is stored together with order information in the same row.  
For example, in **row 13**, the row has:

- `product_id = P008`
- `product_name = Webcam`
- `category = Electronics`
- `unit_price = 2100`

But the same row also needs order details like:

- `order_id = ORD1185`
- `customer_id = C003`
- `customer_name = Amit Verma`
- `order_date = 15/06/2023`
- `sales_rep_id = SR03`

This means if the company wants to add a new product before any customer orders it, they cannot store it properly without also creating an order row. That is an insert anomaly.

---

### Update Anomaly
An update anomaly happens when the same information is repeated in many rows, and changing it in one row may not change it in all rows.

For example, the same sales representative `SR01` appears in more than one row:

- **row 3** has `office_address = Mumbai HQ, Nariman Point, Mumbai - 400021`
- **row 39** has `office_address = Mumbai HQ, Nariman Pt, Mumbai - 400021`

The columns involved are:

- `sales_rep_id`
- `office_address`

This creates a problem because the same office address is written in different ways for the same sales rep. If someone updates one row but forgets the other row, the data becomes inconsistent. That is an update anomaly.

---

### Delete Anomaly
A delete anomaly happens when deleting one row also removes other important information.

For example, **row 13** contains the only record for:

- `product_id = P008`
- `product_name = Webcam`
- `category = Electronics`
- `unit_price = 2100`

If this row is deleted because order `ORD1185` is removed, then all information about product `P008` will also be lost.

So by deleting one order row, the company may accidentally delete product data too. That is a delete anomaly.



## Normalization Justification

I normalized the flat file into four tables:
- customers
- products
- sales_reps
- orders

Customer information is stored only in the customers table.
Product information is stored only in the products table.
Sales representative information is stored only in the sales_reps table.
Order information is stored in the orders table.

This removes repeated data and reduces insert, update, and delete anomalies.

The source CSV contains only 3 distinct sales representatives, so only 3 valid rows can be inserted into the sales_reps table without creating artificial data.
Keeping all data in one table may look easy, but it creates many problems. So I do not agree that normalization is over-engineering.

In the original flat table, the same customer, product, and sales representative information is repeated many times. For example, if Rohan Mehta makes more than one order, his name, email, and city will be written again in every order row. The same happens for product details and sales representative details. This makes the table bigger and harder to manage.

It also creates update anomaly. For example, if the office address of Deepak Joshi changes, we would need to update every row where his data appears. If one row is missed, the data becomes inconsistent.

It creates insert anomaly too. Suppose we want to add a new product, but nobody has ordered it yet. In one big table, we may not be able to store that product easily without creating a fake or empty order.

It also creates delete anomaly. If we delete the only order of a product, we may also lose the product information from the system.

That is why normalization is useful. By dividing the data into separate tables such as customers, products, sales_reps, and orders, we store each fact only once. This reduces duplication, keeps the data clean, and makes updates easier. So in this dataset, normalization is a better design than keeping everything in one table.