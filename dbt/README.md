# dbt Configuration

## dbt Must-Haves

I'll want the packages in `packages.yml` on any dbt project I work on.

* [dbt-utils](https://github.com/dbt-labs/dbt-utils) - I always *think* I need something custom and then realize there's a way to do it with something in dbt-utils
* [dbt-audit-helper](https://github.com/dbt-labs/dbt-audit-helper) - This package makes refactoring and testing PR changes a breeze.
* [dbt-codegen](https://github.com/dbt-labs/dbt-codegen) - Another productivity package, this one makes it easy to generate sources or base models

## dbt Aliases

Find them in `oh-my-zsh/dbt.zsh`

dbt zsh aliases are a way to type dbt commands faster, e.g. instead of typing or
auto-completing `dbt docs generate` I can type `dbtdg` instead. If you spend all
day in the command line this saves time!

## dbt Functions

Functions allow for more functionality than aliases. They accept arguments and
are easier to read for longer or more complex commands. For dbt run commands I
like using `say done` at the end of the function. If a model takes long enough
to run for me to get distracted this calls my attention back to the task at hand
as soon as it's done.

### `dbtah`

This function will compile the `audit_helper_template` for the model you specify,
remove the pesky whitespace, and copy the output to the clipboard so you can run
it in your query tool of choice.
