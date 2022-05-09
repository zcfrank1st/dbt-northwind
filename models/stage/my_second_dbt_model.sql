
-- Use the `ref` function to select from other models

select *
from {{ ref('v_stg_customers') }}
