select 
    DISTINCT {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_key,
    product_id,
    product_name,
    price_usd as product_price,
    product_created_at
from {{ref('int_order_items')}}