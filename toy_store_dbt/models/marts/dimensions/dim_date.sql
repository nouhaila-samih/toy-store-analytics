with dates as (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2012-01-01' as date)",
        end_date="cast('2027-01-01' as date)"
    ) }}
)
select
    cast(to_char(date_day, 'YYYYMMDD') as integer) as date_key,
    date_day as full_date,
    extract(day from date_day) as day_of_month,
    extract(dow from date_day) as day_of_week,
    extract(week from date_day) as week_number,
    extract(month from date_day) as month_number,
    to_char(date_day, 'Mon') as month_name,
    trim(to_char(date_day, 'Month')) as full_month_name,
    extract(quarter from date_day) as quarter_number,
    extract(year from date_day) as year,
    case
        when extract(dow from date_day) in (0, 6)
        then true
        else false
    end as is_weekend,
    date_trunc('month', date_day)::date
        = date_day
        as is_month_start,
    (
        date_day
        = (
            date_trunc('month', date_day)
            + interval '1 month'
            - interval '1 day'
        )::date
    ) as is_month_end
from dates