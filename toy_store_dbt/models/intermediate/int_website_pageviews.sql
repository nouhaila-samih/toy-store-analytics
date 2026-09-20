
select pv.website_pageview_id,
    pv.visited_at,
    pv.website_session_id,
    pv.pageview_url,

    s.user_id,
    s.is_repeat_session,
    s.started_at,
    s.utm_source,
    s.utm_campaign,
    s.utm_content,
    s.device_type,
    s.http_referer

from {{ref('stg_website_pageviews')}} pv 
    LEFT JOIN {{ref('stg_website_sessions')}} s 
    on pv.website_session_id=s.website_session_id