-- The model needs to be disabled so it will be ignored while in typical compilation
-- This is required because dbt won't find a node named 'model_to_audit'
-- Substitute the correct production schema and database for your environment
    {{
      config(
        enabled = false,
        )
    }}

{%- set audit_model = "model_to_audit" -%}
{%- set prod_schema = "prod_schema_name" -%}
{%- set dbt_database = "prod_database_name" -%}
{%- set dbt_relation = ref(audit_model) -%}

{%- set old_etl_relation=adapter.get_relation(
      database=dbt_database,
      schema=prod_schema,
      identifier=audit_model
) -%}

{# Generate the audit query - update primary key as needed #}
{{ audit_helper.compare_relations(
    a_relation=old_etl_relation,
    b_relation=dbt_relation,
    primary_key="primary_key_update_before_running"
) }}