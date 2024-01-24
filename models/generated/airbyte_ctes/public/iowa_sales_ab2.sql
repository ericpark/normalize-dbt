{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to cast each column to its adequate SQL type converted from the JSON schema type
-- depends_on: {{ ref('iowa_sales_ab1') }}
select
    cast(city as {{ dbt_utils.type_string() }}) as city,
    cast({{ adapter.quote('date') }} as {{ dbt_utils.type_string() }}) as {{ adapter.quote('date') }},
    cast(pack as {{ dbt_utils.type_float() }}) as pack,
    cast(county as {{ dbt_utils.type_string() }}) as county,
    cast(address as {{ dbt_utils.type_string() }}) as address,
    cast(category as {{ dbt_utils.type_string() }}) as category,
    cast(zip_code as {{ dbt_utils.type_float() }}) as zip_code,
    cast(export_id as {{ dbt_utils.type_string() }}) as export_id,
    cast(store_name as {{ dbt_utils.type_string() }}) as store_name,
    cast(item_number as {{ dbt_utils.type_string() }}) as item_number,
    cast(vendor_name as {{ dbt_utils.type_string() }}) as vendor_name,
    cast(bottles_sold as {{ dbt_utils.type_float() }}) as bottles_sold,
    cast(sale_dollars as {{ dbt_utils.type_float() }}) as sale_dollars,
    cast(store_number as {{ dbt_utils.type_string() }}) as store_number,
    cast(category_name as {{ dbt_utils.type_string() }}) as category_name,
    cast(county_number as {{ dbt_utils.type_string() }}) as county_number,
    cast(vendor_number as {{ dbt_utils.type_string() }}) as vendor_number,
    cast(store_location as {{ dbt_utils.type_string() }}) as store_location,
    cast(bottle_volume_ml as {{ dbt_utils.type_float() }}) as bottle_volume_ml,
    cast(item_description as {{ dbt_utils.type_string() }}) as item_description,
    cast(state_bottle_cost as {{ dbt_utils.type_float() }}) as state_bottle_cost,
    cast(volume_sold_liters as {{ dbt_utils.type_float() }}) as volume_sold_liters,
    cast(state_bottle_retail as {{ dbt_utils.type_float() }}) as state_bottle_retail,
    cast(volume_sold_gallons as {{ dbt_utils.type_float() }}) as volume_sold_gallons,
    cast(invoice_and_item_number as {{ dbt_utils.type_string() }}) as invoice_and_item_number,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ ref('iowa_sales_ab1') }}
-- iowa_sales
where 1 = 1

