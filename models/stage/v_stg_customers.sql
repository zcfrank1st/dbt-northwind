with source_customers as (
    select * from {{ source('public', 'customers') }}
),

v_stg_customers as (

    select
        customer_id,
        company_name,
        contact_name,
        contact_title,
        address,
        city,
        region,
        postal_code,
        country,
        phone,
        fax,
        'CUSTOMERS' as source,
        now() as load_datetime,
        current_date as start_date,
        to_date('9999-12-31','yyyy-MM-dd') as end_date

    from source_customers

)

select * from v_stg_customers