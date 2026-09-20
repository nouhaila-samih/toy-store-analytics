with source as (
    select * from {{source('raw','orders')}}
) ,
renamed as (
    select order_id,
        created_at::timestamp as ordered_at,
        website_session_id,
        user_id,
        primary_product_id,
        items_purchased::integer as quantity,
        price_usd::numeric as price_usd,
        cogs_usd::numeric as cost_of_good
    from source
)
select * from renamed