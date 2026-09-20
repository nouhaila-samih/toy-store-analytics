select table_name from information_schema.tables 
where table_schema='raw'
order by table_name;

-- exploration des noms de colonnes avec leurs types
select column_name, data_type from information_schema.columns 
where table_schema='raw' and table_name= 'orders';

select * from raw.orders limit 20;
select * from raw.orders where primary_product_id=3 ;

select product_id, count(product_id) as nb from raw.order_items group by product_id;



SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS non_null_customer_id
FROM raw.orders;

select * from raw.order_items where order_id is null;

select min(created_at) as first_order, max(created_at) as last_order from raw.orders;