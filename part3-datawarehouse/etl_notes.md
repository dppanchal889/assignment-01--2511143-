## ETL Decisions

### Decision 1 — Standardized date format
Problem: Date values need to be consistent for sorting, filtering, and reporting in the warehouse.
Resolution: I converted all dates into the `YYYY-MM-DD` format before loading them into the `dim_date` table.

### Decision 2 — Standardized category values
Problem: Category values should be stored in one consistent way, because differences in naming or letter casing can affect reports.
Resolution: I standardized the category names into `Electronics`, `Clothing`, and `Groceries`.

### Decision 3 — Handled missing store city values
Problem: Some store records had missing city values, which would make the store dimension incomplete.
Resolution: I filled missing `store_city` values using the related store name so that each store record had complete information.