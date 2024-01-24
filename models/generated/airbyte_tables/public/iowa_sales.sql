{{ config(
    indexes = [{'columns':['_airbyte_emitted_at'],'type':'btree'}],
    unique_key = '_airbyte_ab_id',
    schema = "public",
    post_hook = ["
                    {%
                        set scd_table_relation = adapter.get_relation(
                            database=this.database,
                            schema=this.schema,
                            identifier='iowa_sales_scd'
                        )
                    %}
                    {%
                        if scd_table_relation is not none
                    %}
                    {%
                            do adapter.drop_relation(scd_table_relation)
                    %}
                    {% endif %}
                        "],
    tags = [ "top-level" ]
) }}
-- Final base SQL model
-- depends_on: {{ ref('iowa_sales_ab3') }}
select
    city,
    {{ adapter.quote('date') }},
    pack,
    county,
    address,
    category,
    zip_code,
    export_id,
    store_name,
    item_number,
    vendor_name,
    bottles_sold,
    sale_dollars,
    store_number,
    category_name,
    county_number,
    vendor_number,
    store_location,
    bottle_volume_ml,
    item_description,
    state_bottle_cost,
    volume_sold_liters,
    state_bottle_retail,
    volume_sold_gallons,
    invoice_and_item_number,
    _airbyte_ab_id,
    _airbyte_emitted_at,
    {{ current_timestamp() }} as _airbyte_normalized_at,
    _airbyte_iowa_sales_hashid
from {{ ref('iowa_sales_ab3') }}
-- iowa_sales from {{ source('public', '_airbyte_raw_iowa_sales') }}
where 1 = 1

