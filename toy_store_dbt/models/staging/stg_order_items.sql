with source as (
    select * from {{source('raw','order_items')}}
),
renamed as (
    select order_item_id,
        created_at::timestamp as ordered_at,
        order_id,
        product_id,
        is_primary_item::integer::boolean as is_primary_item,
        price_usd::numeric as price_usd,
        cogs_usd::numeric as cost_of_good
    from source
)
select * from renamed