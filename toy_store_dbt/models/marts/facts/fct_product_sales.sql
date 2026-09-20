select
    {{ dbt_utils.generate_surrogate_key(['product_id'])}} as product_key,
    cast(to_char(oi.ordered_at, 'YYYYMMDD') as integer) as date_key,
    oi.product_id,
    count(oi.product_id) as unit_sold,
    count(distinct oi.order_id) as order_count,
    sum(oi.price_usd) as total_sales,
    sum(oi.cost_of_good) as total_goods,
    count(case when oi.is_refunded = true then 1 end) as n_refunded

from {{ref('int_order_items')}} oi 
    group by product_key, product_id, date_key
