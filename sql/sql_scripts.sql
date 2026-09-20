
/*
"maven_fuzzy_factory_data_dictionary"
"order_item_refunds"
"order_items"
"orders"
"products"
"website_pageviews"
"website_sessions"
*/

select * from raw.maven_fuzzy_factory_data_dictionary where "Table"='website_sessions';

select distinct "Table" from raw.maven_fuzzy_factory_data_dictionary;

select * from raw.website_sessions limit;
select distinct is_primary_item, count(*) as n from raw.order_items group by is_primary_item;

select distinct pageview_url,count(*) as n from raw.website_pageviews group by pageview_url order by n desc;


EXPLAIN select count(*) as n from raw.orders group by order_id having count(*)>1;




select o.quantity, o.price_usd as order_price, oi.price_usd as item_price from dev_staging.stg_order_items oi 
left join dev_staging.stg_orders o on o.order_id=oi.order_id where o.quantity > 1 order by o.quantity;


select distinct price_usd, product_id from dev_staging.stg_order_items ;

select distinct price_usd, product_name, price_usd from dev_intermediate.int_order_items;

select user_id, count(*) as n from dev_intermediate.int_order_items group by user_id order by n desc;
select user_id, count(*) as n_orders from dev_staging.stg_orders group by user_id order by n desc;


select min(ordered_at), max(ordered_at) from dev_intermediate.int_order_items;

select * from dev_intermediate.int_order_items where is_refunded = true;

select * from dev_marts.fct_product_sales where n_refunded!=0;
select * from dev_marts.fct_order_items where is_refunded = true;

