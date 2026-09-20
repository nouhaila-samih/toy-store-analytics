# Toy Store Analytics

Projet d'**Analytics Engineering** basé sur des données e-commerce.
L'objectif est de transformer des données brutes en un **data warehouse analytique fiable, testé et structuré avec dbt**.

## Objectives

* Transformer et nettoyer les données sources.
* Structurer les données selon une architecture analytique claire.
* Construire un **Star Schema** avec des dimensions et des tables de faits.
* Mettre en place des tests de qualité des données.
* Préparer les données pour l'analyse et la visualisation.

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

* **Staging** → nettoyage, typage et standardisation.
* **Intermediate** → logique métier et enrichissement.
* **Marts** → modèles analytiques finaux.

## Data Model

Le projet utilise une approche **Star Schema**.

### Dimensions

* `dim_product` — informations sur les produits.
* `dim_date` — dimension calendrier.

### Facts

* `fct_orders` — niveau commande.
* `fct_order_items` — niveau article commandé.
* `fct_product_sales` — ventes agrégées par produit et par jour.
* `fct_website_pageviews` — événements de navigation.

Les modèles utilisent des **surrogate keys** afin de gérer les relations entre les différentes tables de manière cohérente.

## Data Quality

La qualité des données est contrôlée avec des tests dbt :

* `not_null`
* `unique`
* `relationships`
* tests personnalisés sur les valeurs

Les modèles et colonnes importants sont également documentés dans les fichiers `schema.yml`.

## Technologies

* **SQL**
* **pandas**
* **dbt**
* **PostgreSQL**
* **Jinja**
* **dbt-utils**

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
* Revenue and costs
* Refunds
* Website activity
* Trends over time

## Project Goal

This project demonstrates practical skills in **SQL, dbt, data transformation, dimensional modeling, data quality and Analytics Engineering**.
