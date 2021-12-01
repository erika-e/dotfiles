# VS Code Configurations

## VSCode Extensions and Settings

The dotfiles will install a number of extensions I like, including the following:


## Settings

The settings file is a combination of things I already had and some things I
picked up from [Anders' discourse post](https://discourse.getdbt.com/t/setting-up-vscode-to-use-with-the-dbt-cli/3291)

* Showing white spaces as dots
* Making modified files easier to see
* A ruler at 80 characters
* black for Python formatting and format on save

## Extensions

### [vscode-dbt-power-user](https://marketplace.visualstudio.com/items?itemName=innoverio.vscode-dbt-power-user)

dbt-power-user makes navigating around your dbt project while you're developing
a breeze. It provides autocompletion within VSCode for models, macros, and
sources. The extension has a sidebar that allows you to navigate parent-child
model relationships with a single click.

Other features you should check out:

* command palette for dbt commands
* running models from the play button
* go to definition for macros

### [vscode-dbt](https://marketplace.visualstudio.com/items?itemName=innoverio.vscode-dbt-power-user)

This extension is installed automatically by dbt-power-user when it's installed.
The `settings.json` file included with this project has the file associations
recommended by the installer.

For some snippets, e.g. `{# #}` my editor autocompletes on its own. For others,
I need to use the use the command palette to open the `Insert Snippet` menu if
needed.

This extension has snippets for jinja, models, and sources.

### Better Jinja aka jinjahtml

### code-spell-checker

### pydocstring

### rainbow-csv

### vscode-markdownlint

### openmatchingfiles

### Python extensions
