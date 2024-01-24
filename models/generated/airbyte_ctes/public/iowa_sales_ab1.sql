{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
-- depends_on: {{ source('public', '_airbyte_raw_iowa_sales') }}
select
    {{ json_extract_scalar('_airbyte_data', ['city'], ['city']) }} as city,
    {{ json_extract_scalar('_airbyte_data', ['date'], ['date']) }} as {{ adapter.quote('date') }},
    {{ json_extract_scalar('_airbyte_data', ['pack'], ['pack']) }} as pack,
    {{ json_extract_scalar('_airbyte_data', ['county'], ['county']) }} as county,
    {{ json_extract_scalar('_airbyte_data', ['address'], ['address']) }} as address,
    {{ json_extract_scalar('_airbyte_data', ['category'], ['category']) }} as category,
    {{ json_extract_scalar('_airbyte_data', ['zip_code'], ['zip_code']) }} as zip_code,
    {{ json_extract_scalar('_airbyte_data', ['export_id'], ['export_id']) }} as export_id,
    {{ json_extract_scalar('_airbyte_data', ['store_name'], ['store_name']) }} as store_name,
    {{ json_extract_scalar('_airbyte_data', ['item_number'], ['item_number']) }} as item_number,
    {{ json_extract_scalar('_airbyte_data', ['vendor_name'], ['vendor_name']) }} as vendor_name,
    {{ json_extract_scalar('_airbyte_data', ['bottles_sold'], ['bottles_sold']) }} as bottles_sold,
    {{ json_extract_scalar('_airbyte_data', ['sale_dollars'], ['sale_dollars']) }} as sale_dollars,
    {{ json_extract_scalar('_airbyte_data', ['store_number'], ['store_number']) }} as store_number,
    {{ json_extract_scalar('_airbyte_data', ['category_name'], ['category_name']) }} as category_name,
    {{ json_extract_scalar('_airbyte_data', ['county_number'], ['county_number']) }} as county_number,
    {{ json_extract_scalar('_airbyte_data', ['vendor_number'], ['vendor_number']) }} as vendor_number,
    {{ json_extract_scalar('_airbyte_data', ['store_location'], ['store_location']) }} as store_location,
    {{ json_extract_scalar('_airbyte_data', ['bottle_volume_ml'], ['bottle_volume_ml']) }} as bottle_volume_ml,
    {{ json_extract_scalar('_airbyte_data', ['item_description'], ['item_description']) }} as item_description,
    {{ json_extract_scalar('_airbyte_data', ['state_bottle_cost'], ['state_bottle_cost']) }} as state_bottle_cost,
    {{ json_extract_scalar('_airbyte_data', ['volume_sold_liters'], ['volume_sold_liters']) }} as volume_sold_liters,
    {{ json_extract_scalar('_airbyte_data', ['state_bottle_retail'], ['state_bottle_retail']) }} as state_bottle_retail,
    {{ json_extract_scalar('_airbyte_data', ['volume_sold_gallons'], ['volume_sold_gallons']) }} as volume_sold_gallons,
    {{ json_extract_scalar('_airbyte_data', ['invoice_and_item_number'], ['invoice_and_item_number']) }} as invoice_and_item_number,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at
from {{ source('public', '_airbyte_raw_iowa_sales') }} as table_alias
-- iowa_sales
where 1 = 1

