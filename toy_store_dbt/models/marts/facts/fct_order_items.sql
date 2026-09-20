
select {{dbt_utils.generate_surrogate_key(['order_item_id'])}} as order_item_key,
    order_item_id,
    cast(to_char(ordered_at, 'YYYYMMDD') as integer) as date_key,
    {{dbt_utils.generate_surrogate_key(['order_id'])}} as order_key,
    {{dbt_utils.generate_surrogate_key(['product_id'])}} as product_key,
    is_primary_item,
    price_usd,
    cost_of_good,
    margin_usd,
    
    is_refunded,
    refunded_at,
    refund_amount_usd,

    website_session_id,
    user_id

from {{ref('int_order_items')}}
