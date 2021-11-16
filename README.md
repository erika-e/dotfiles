# dotfiles

Analytics Engineering dotfiles for an M1 Mac

## Setup Steps

Open your new mac and go through all the setup screens - this takes a little while.
Once complete, you'll need [iTerm2](https://iterm2.com/). When I did this, I got notified that I needed to install:

* Developer tools
* Message about installing pip3
Let's hope neither of those cause problems later

Open applications in Finder. Using the options menu in the top right or a right
 click, open the menu for iTerm and select `Duplicate`. On the new copy, select
 `Get Info` and check the option to `Open using Rosetta`. You'll be prompted to
 install Rosetta.

## Git Setup

This script uses [Git Credential Manager Core](https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git). You should be prompted to sign in during the setup process. If you're not, you will be prompted the first time you try to clone a repository with `https`

## Run the Setup Script

I pasted it straight into the iTerm2 terminal.

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
* export the vs code extensions to the repo file

Copying settings down:

* Copy .zshrc to ~/.zshrc
* Install everything in the brewfile
* Install the extensions

### Command Line Extension Management

* [VS Code Help Docs](https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management)
* [Parse each line of a text file as an arguement to a command](https://unix.stackexchange.com/questions/149726/how-to-parse-each-line-of-a-text-file-as-an-argument-to-a-command)
* To export extensions to this repo use `code --list-extensions > vscode-extensions.txt`
