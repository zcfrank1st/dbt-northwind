{{ codegen.generate_model_yaml(
    model_name='v_stg_customers'
) }}

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
        fax

    from source_customers

)

select * from v_stg_customers