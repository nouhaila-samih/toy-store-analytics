with source as (
    select * from {{source('raw','products')}}
),
renamed as (
    select product_id,
        created_at::timestamp as product_created_at,
        product_name 
    from source
)
select * from renamed