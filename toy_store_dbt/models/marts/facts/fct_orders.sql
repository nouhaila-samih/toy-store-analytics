with int_metrics as(
    select order_id,
        case 
            when count(case when is_refunded = true then 1 end) > 0
        then true 
        else false 
        end as had_refunded_item
    from {{ref('int_order_items')}} 
    group by order_id
)

select {{dbt_utils.generate_surrogate_key(['o.order_id'])}} as order_key,
    o.order_id,
    cast(to_char(o.ordered_at, 'YYYYMMDD') as integer) as date_key,
    o.website_session_id,
    o.user_id,
    o.primary_product_id,
    o.quantity,
    o.price_usd,
    o.cost_of_good,

    i.had_refunded_item

from {{ref('stg_orders')}} o left join int_metrics i on o.order_id=i.order_id