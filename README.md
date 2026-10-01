# Toy Store Analytics

An **Analytics Engineering** project based on e-commerce data.
The goal is to transform raw data into a **reliable, tested, and structured analytical data warehouse using dbt**.

## Objectives

* Transform and clean raw source data.
* Structure data using a clear analytical architecture.
* Build a **Star Schema** with dimensions and fact tables.
* Implement data quality tests.
* Prepare data for analysis and visualization.

## Architecture

```text
RAW
 ↓
STAGING
 ↓
INTERMEDIATE
 ↓
MARTS
```

* **Staging** → cleaning, data type casting, and standardization.
* **Intermediate** → business logic and data enrichment.
* **Marts** → final analytical models.

## Data Model

The project follows a **Star Schema** approach.

### Dimensions

* `dim_product` — product information.
* `dim_date` — calendar dimension.

### Facts

* `fct_orders` — order-level data.
* `fct_order_items` — order item-level data.
* `fct_product_sales` — daily aggregated sales by product.
* `fct_website_pageviews` — website pageview events.

The models use **surrogate keys** to maintain consistent relationships between tables.

## Data Quality

Data quality is monitored using dbt tests:

* `not_null`
* `unique`
* `relationships`
* Custom value validation tests

Important models and columns are also documented in `schema.yml` files.

## Technologies

* **SQL**
* **pandas**
* **dbt**
* **PostgreSQL**
* **Jinja**
* **dbt-utils**
* **Power BI**

## Project Structure

```text
toy-store-analytics/
├── README.md
├── data/
├── scripts/
└── toy_store_dbt/
    ├── models/
    │   ├── staging/
    │   ├── intermediate/
    │   └── marts/
    ├── tests/
    ├── macros/
    └── dbt_project.yml
```

## Getting Started

Clone the repository and install the required dependencies.

```bash
git clone <repository-url>
cd toy-store-analytics
```

Install dbt packages:

```bash
dbt deps
```

Run the models:

```bash
dbt run
```

Run the tests:

```bash
dbt test
```

## Analytics

The resulting data model can be used to analyze:

* Sales and orders
* Product performance
* Profit 
* Refunds
* Users
* Website activity
* Trends over time

## Power BI Dashboard

The `marts` models power the Power BI dashboard for key business metrics.

![Power BI Dashboard Screenshot](C:\Users\LENOVO\Documents\VS\toy-store-analytics\screenshots\POWERBI SALES.png)

## Project Goal

This project demonstrates practical skills in **SQL, dbt, data transformation, dimensional modeling, data quality, Analytics Engineering and Data Visualization**.
