{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model: 
  northwind: "customers"
    
derived_columns:
  SOURCE: "!CUSTOMERS"
  LOAD_DATETIME: "NOW()"
  EFFECTIVE_FROM: "NOW()"
  START_DATE: "NOW()"
  END_DATE: "TO_DATE('9999-31-12','YYYY-MM-DD')"
hashed_columns:
  CUSTOMER_HK: "customer_id"
  CUSTOMER_HASHDIFF:
    is_hashdiff: true
    columns:
      - "company_name"
      - "contact_name"
      - "contact_title"
      - "address"
      - "city"
      - "region"
      - "postal_code"
      - "country"
      - "phone"
      - "fax"
{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{{ dbtvault.stage(include_source_columns=true,
                  source_model=metadata_dict['source_model'],
                  derived_columns=metadata_dict['derived_columns'],
                  hashed_columns=metadata_dict['hashed_columns'],
                  ranked_columns=none) }}