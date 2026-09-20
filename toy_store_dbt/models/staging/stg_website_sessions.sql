with source as (
    select * from {{source('raw','website_sessions')}}
),
renamed as (
    select website_session_id,
        created_at::timestamp as started_at,
        user_id,
        is_repeat_session::integer::boolean as is_repeat_session,
        utm_source,
        utm_campaign,
        utm_content,
        device_type,
        http_referer
    from source
)
select * from renamed