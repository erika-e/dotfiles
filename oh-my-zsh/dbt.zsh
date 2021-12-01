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
