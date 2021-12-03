# VS Code Configurations

## Settings

The settings file is a combination of things I already had and some things I
picked up from [Anders' discourse post](https://discourse.getdbt.com/t/setting-up-vscode-to-use-with-the-dbt-cli/3291)

I didn't use the settings for switching between model and compiled SQL, because
this is included with the dbt-power-user extension.

* Showing white spaces as dots
* Making modified files easier to see
* A ruler at 80 characters
* black for Python formatting and format on save
* any settings required for the extensions below, comments note which settings go with each extension

## Extensions

Extensions are listed by the name they appear under in `extensions.txt`

### [vscode-dbt-power-user](https://marketplace.visualstudio.com/items?itemName=innoverio.vscode-dbt-power-user)

dbt-power-user makes navigating around your dbt project while you're developing
a breeze. It provides autocompletion within VSCode for models, macros, and
sources. The extension has a sidebar that allows you to navigate parent-child
model relationships.

Other features you should check out:

* command palette for dbt commands
* running models from the play button
* go to definition for macros
* switch between compiled and model SQL

### [vscode-dbt](https://marketplace.visualstudio.com/items?itemName=innoverio.vscode-dbt-power-user)

This extension is installed automatically by dbt-power-user when it's installed.
The `settings.json` file included with this project has the file associations
recommended by the installer.

For some snippets, e.g. `{# #}` my editor autocompletes on its own. For others,
I need to use the use the command palette to open the `Insert Snippet` menu if
needed.

This extension has snippets for jinja, models, and sources.

### Better Jinja aka [jinjahtml](https://marketplace.visualstudio.com/items?itemName=samuelcolvin.jinjahtml&ssr=false#overview)

Syntax highlighting for jinja. `settings.json` has a file association in it that
will automatically add highlighting for SQL files.

### [code-spell-checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker)

I have a couple words that I frequently misspell. Eventually I will learn to
spell arguments correctly on the first try. Spell checking is currently enabled
only on markdown and yaml files, but you could enable it for other file types if
you liked. The extension page has a great overview of configuration options.

### [pydocstring](https://marketplace.visualstudio.com/items?itemName=kopub.pydocstring)

Does one thing extremely well. Not very configurable, [this](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring)
looks like a reasonable alternative.

### [rainbow-csv](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv)

Who doesn't like a good 🌈? This extension makes editing seed files in VSCode
easier by colorizing each column of the csv in a different color.

Some other cool features I didn't know this extension had until I read the docs:

* Edit and filter tables with a SQL like query language
* Lint csv files
* Multicursor column editing

### [vscode-markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint)

Helps keep your markdown files consistent. I am not fantastic at picking up on
lint-level errors or inconsistencies in code. It's helpful to have a tool that
does that for me to keep everything pretty and consistent.

This linter has a lot of configuration options, but I've found the basic install
works well for me.

### [openmatchingfiles](https://marketplace.visualstudio.com/items?itemName=bcanzanella.openmatchingfiles)

This extension is very convenient if you have related files stored in different
directories of your dbt project. I originally needed it for a big refactoring
project.

### Python extensions

The Python extensions I use are pretty basic. They get the job done but I'm sure
there are opportunities for further improvement here. Feel free to add on and
make a PR!
