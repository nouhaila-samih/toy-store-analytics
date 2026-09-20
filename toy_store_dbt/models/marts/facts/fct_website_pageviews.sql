select
    {{ dbt_utils.generate_surrogate_key(['website_pageview_id']) }} as pageview_key,

    website_pageview_id,

    cast(to_char(visited_at, 'YYYYMMDD') as integer) as date_key,
    {{ dbt_utils.generate_surrogate_key(['website_session_id']) }} as session_key,

    website_session_id,
    user_id,

    pageview_url,
    visited_at,

    is_repeat_session,
    started_at,

    utm_source,
    utm_campaign,
    utm_content,

    device_type,
    http_referer

from {{ ref('int_website_pageviews') }}