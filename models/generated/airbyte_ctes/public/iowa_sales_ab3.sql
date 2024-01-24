{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "_airbyte_public",
    tags = [ "top-level-intermediate" ]
) }}
-- SQL model to build a hash column based on the values of this record
-- depends_on: {{ ref('iowa_sales_ab2') }}
select
    {{ dbt_utils.surrogate_key([
        'city',
        adapter.quote('date'),
        'pack',
        'county',
        'address',
        'category',
        'zip_code',
        'export_id',
        'store_name',
        'item_number',
        'vendor_name',
        'bottles_sold',
        'sale_dollars',
        'store_number',
        'category_name',
        'county_number',
        'vendor_number',
        'store_location',
        'bottle_volume_ml',
        'item_description',
        'state_bottle_cost',
        'volume_sold_liters',
        'state_bottle_retail',
        'volume_sold_gallons',
        'invoice_and_item_number',
        'invoice_id',
        'line_number',
    ]) }} as _airbyte_iowa_sales_hashid,
    tmp.*
from {{ ref('iowa_sales_ab2') }} tmp
-- iowa_sales
where 1 = 1

