
select oi.order_item_id,
    oi.ordered_at,
    oi.order_id,
    oi.product_id,
    oi.is_primary_item,
    oi.price_usd,
    oi.cost_of_good,
    oi.price_usd - oi.cost_of_good as margin_usd,

    case when oi.order_item_id in (r.order_item_id) then true else false  end as is_refunded,
    r.refunded_at,
    coalesce(r.refund_amount_usd,0) as refund_amount_usd,

    o.website_session_id,
    o.user_id,

    p.product_name,
    p.product_created_at

from {{ref('stg_order_items')}} oi 
    LEFT JOIN {{ref('stg_orders')}} o on oi.order_id=o.order_id
    LEFT JOIN {{ref('stg_order_item_refunds')}} r on oi.order_item_id=r.order_item_id
    LEFT JOIN {{ref('stg_products')}} p on oi.product_id=p.product_id
