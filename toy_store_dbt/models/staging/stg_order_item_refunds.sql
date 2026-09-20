with source as (
    select * from {{source('raw','order_item_refunds')}}
),
renamed as (
    select order_item_refund_id,
    created_at::timestamp as refunded_at,
    order_item_id,
    order_id,
    refund_amount_usd::numeric as refund_amount_usd 
    from source
)
select * from renamed