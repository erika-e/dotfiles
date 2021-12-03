# dbt configuration for Oh-My-Zsh

# dbt aliases
alias dbtr="dbt --warn-error run --fail-fast" # sensible local defaults
alias dbtt="dbt test" # run all tests
alias dbtb="dbt build" # run build command https://docs.getdbt.com/reference/commands/build
alias dbtdg="dbt docs generate"
alias dbtds="dbt docs serve"
alias dbtc="dbt compile"
alias dbtfresh="dbt clean" #so fresh and so clean clean

# dbt Functions

# Run specific model with fail fast flag
function dbtrff() {
   dbt run -m $1 --fail-fast
   say done
}

# Run and test specific model with fail fast flag
function dbtrt() {
    dbt run -m $1 --fail-fast && dbt test -m $1 --warn-error
    say done
}

# Audit helper helper
function dbtah() {
    # note: to use this function you will need the template
    # copy audit_helper_template.sql from dotfiles to the analysis directory of your dbt project
    # update defaults as required
    # substitute the model name from the arguement
    gsed -i "s/model_to_audit/$1/" analysis/audit_helper_template.sql
    # enable the audit_helper_template
    gsed -i 's/enabled = false/enabled = true/' analysis/audit_helper_template.sql
    # compile
    dbt compile -m audit_helper_template
    cat target/compiled/*/analysis/audit_helper_template.sql | awk NF | pbcopy
    # modify the template back to the defaults
    gsed -i 's/enabled = true/enabled = false/' analysis/audit_helper_template.sql
    gsed -i "s/$1/model_to_audit/" analysis/audit_helper_template.sql
    say copy pasta
}

# dbtcodegen generate yaml model
function dbtcgmy () {
    read "model_name?Enter the name of the model: "

    dbt run-operation generate_model_yaml --args '{"model_name":"'${model_name}'"}' | awk '!/^Running with dbt=/' | pbcopy | pbpaste
}

# dbtcodegen generate base model
function dbtcgbm () {
    # Requires dbt-codegen, must be executed from a directory with a valid dbt project
    read "source_name?Enter the source for the base model: "
    read "table_name?Enter the table name for the base model: "
    if read -q "choice?Enter Y/y for leading commas: ";
    then
        leading_commas="True"
    else
        leading_commas="False"
    fi

    #pbcopy and pbpaste ensures user can either copy output or direct it to a file
    
    dbt run-operation generate_base_model --args '{"source_name":"'${source_name}'","table_name":"'${table_name}'","leading_commas":'${leading_commas}'}' | awk '!/^Running with dbt=/' | pbcopy | pbpaste
}

# dbtcodegen generate source yaml
function dbtcgsy () {
    read "schema_name?Enter the schema name for the sources you'd like to generate"
    read "database_name?Enter the database name for the sources you'd like to generate"
    if read -q "choice_1?Enter Y/y to generate columns";
    then 
        generate_columns="True"
    else
        generate_columns="False"
    fi

    if read -q "choice_2?Enter Y/y to include_descriptions";
    then
        include_descriptions="True"
    else
        include_descriptions="False"
    fi

    dbt run-operation generate_source --args '{"schema_name":"'${schema_name}'","database_name":"'${database_name}'","generate_columns":'${generate_columns}',"include_descriptions":'${include_descriptions}'}' | awk '!/^Running with dbt=/' | pbcopy | pbpaste

}