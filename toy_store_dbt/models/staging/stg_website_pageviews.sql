with source as (
    select * from {{source('raw','website_pageviews')}}
),
renamed as (
        select website_pageview_id,
        created_at::timestamp as visited_at,
        website_session_id,
        pageview_url 
    from source
)
select * from renamed