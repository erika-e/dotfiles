# dotfiles

Analytics Engineering dotfiles for an M1 Mac

## Setup Steps

Open your new mac and go through all the setup screens - this takes a little while.
Once complete, you'll need [iTerm2](https://iterm2.com/). When I did this, I was
notified that I needed to install:

* Developer tools
* Message about installing pip3

Let's hope neither of those cause problems later

Open applications in Finder. Using the options menu in the top right or a right
click, open the menu for iTerm and select `Duplicate`. On the new copy, select
`Get Info` and check the option to `Open using Rosetta`. You'll be prompted to
install Rosetta.

## Git Setup

This script uses [Git Credential Manager Core](https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git).
You should be prompted to sign in during the setup process. If you're not, you
will be prompted the first time you try to clone a repository with `https`

## Run the Setup Script

I pasted it straight into the iTerm2 terminal.

## What this Script Does

* Installs [Homebrew](https://brew.sh/) to manage packages and software on your mac
* Installs [git](https://git-scm.com/) using homebrew
* Creates a directory called `code` in the directory your terminal was in when you ran the script
* Clones the repository where you're reading this README
* Uses the `Brewfile` from the repository to install most of what you need
* Installs [Oh-My-Zsh](https://ohmyz.sh/)
* Prompts to configure git `user.name` and `user.email` globally
* Installs VSCode extensions [with the command line](https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management)
* Clones the [jaffle_shop](https://github.com/erika-e/jaffle_shop) dbt project and appends a `jaffle_shop` profile to your profiles.yml if it already existed

## Manual Steps

I didn't get docker to install from brew, though some folks [say they have](https://stackoverflow.com/questions/67010057/how-to-run-docker-on-apple-silicon-m1)
I went to the [Docker website](https://docs.docker.com/desktop/mac/apple-silicon/)
and installed it manually.

## Below This Point Are Working Notes

Current state:

* Installs homebrew
* Installs git from the command line with brew
* Installs brewfile dependencies
* Installs oh my zsh
* Fixed zsh-autosuggestions

Things to do:

* Export VS Code settings
* Create a test dbt project
* Use dbt settings from VS Code article
* Finish & Correct VSCode setup
* Add shell scripts to copy settings up and down
* Add a shell script for maintaining the repo, e.g. updating .zshrc, the Brewfile, and the VSCode extension list

Updating dependencies:

* dump the brewfile
* copy ~/.zshrc to .zshrc in dotfiles
* export the vs code extensions to the repo file `code --list-extensions > vscode-extensions.txt`

Copying settings down:

* Copy .zshrc to ~/.zshrc
* Install everything in the brewfile
* Install the extensions

### Command Line Extension Management

* [VS Code Help Docs](https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management)
* [Parse each line of a text file as an arguement to a command](https://unix.stackexchange.com/questions/149726/how-to-parse-each-line-of-a-text-file-as-an-argument-to-a-command)

## Resources I Used Along the Way

* [Parsing text file arguements to commands](https://unix.stackexchange.com/questions/149726/how-to-parse-each-line-of-a-text-file-as-an-argument-to-a-command)
* [Get dbt up and running from the command line on a MacBook with an M1 chip](https://discourse.getdbt.com/t/get-dbt-up-and-running-from-the-command-line-on-a-macbook-with-an-m1-chip/2908)
* [GClunies dotfile repo](https://github.com/GClunies/.dotfile)
* [Setting up VSCode to use with the dbt CLI](https://discourse.getdbt.com/t/setting-up-vscode-to-use-with-the-dbt-cli/3291)
