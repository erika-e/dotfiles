# dbt Configuration

## dbt Must-Have Packages

I'll want the packages in `packages.yml` on any dbt project I work on.

* [dbt-utils](https://github.com/dbt-labs/dbt-utils) - I always *think* I need something custom and then realize there's a way to do it with something in dbt-utils
* [dbt-audit-helper](https://github.com/dbt-labs/dbt-audit-helper) - This package makes refactoring and testing PR changes a breeze.
* [dbt-codegen](https://github.com/dbt-labs/dbt-codegen) - Another productivity package, this one makes it easy to generate sources or base models

## dbt zsh Configuration

### dbt Aliases

Find them in `oh-my-zsh/dbt.zsh`

dbt zsh aliases are a way to type dbt commands faster, e.g. instead of typing or
auto-completing `dbt docs generate` I can type `dbtdg` instead. If you spend all
day in the command line this saves time!

### dbt Functions

Functions allow for more functionality than aliases. They accept arguments and
are easier to read for longer or more complex commands. For dbt run commands I
like using `say done` at the end of the function. If a model takes long enough
to run for me to get distracted this calls my attention back to the task at hand
as soon as it's done.

#### dbt-audit-helper `dbtah`

This function will compile the `audit_helper_template` for the model you specify,
remove the pesky whitespace, and copy the output to the clipboard so you can run
it in your query tool of choice.

#### dbt-codegen functions

I 🧡 dbt-codegen. It's a definite timesaver. It was a pain to remember the
arguments and their names and I found myself looking them up every time I used
them.

This family of shell functions uses prompts to get all the required information
from you, so you don't have to remember the argument names.

By default, each function copies the output from itself to the clipboard and
pastes it into the terminal. This means you can redirect the output to a new
file or append it to an existing file with `dbtcgmy > my_new_file.yml` or
`dbtcgmy >> my_existing_file.yml`

These functions cover all 3 of the macros in dbt-codegen:

* `dbtcgmy` - generate model yaml
* `dbtcgsy` - generate source yaml
* `dbtcggbm` - generate base model

## SQL linting with SQLfluff

[SQLfluff](https://docs.sqlfluff.com/en/stable/index.html) bills itself as the
SQL linter for humans.

Linting your SQL is a great idea. It reduces the cognitive load for everyone
working with dbt models. It simplifies PR review by automatically enforcing a
style guide that's represented as code.

There are a couple things here to help you get going with SQLfluff. The first is
a `Pipfile` which is for a `Pipenv` virtual environment. This is for convenience,
you can use whatever Python package management solution you prefer.

The next is a `.sqlfluff` file which contains a basic dbt-compatible
configuration. You can customize further for your preferences.

Finally, there's a `.sqlfluffignore` files with SQLfluff's recommended dbt
defaults.
