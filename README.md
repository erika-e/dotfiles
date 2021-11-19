# dotfiles

Analytics engineering dotfiles for an M1 macbook. This assumes you want to use
VSCode for your development environment.

## To set up a brand new M1 Macbook

### Do the basics then install iTerm2

Open your new mac and go through all the setup screens - this takes a little
while. Once complete, you'll need to download and install [iTerm2](https://iterm2.com/). When I did this, I was notified that I needed to install:

* Developer tools
* Message about installing pip3

Let's hope neither of those cause problems later

Open applications in Finder. Using the options menu in the top right or a right
click, open the menu for iTerm and select `Duplicate`. On the new copy, select
`Get Info` and check the option to `Open using Rosetta`. You'll be prompted to
install Rosetta. I renamed mine so I can tell the difference.

### Check the setup script

There are comments in `setup_mac.sh` that indicate what everything does. You can
remove anything you don't need.

### What the script will do

* Install [Homebrew](https://brew.sh/) to manage packages and software on your mac
* Install [git](https://git-scm.com/) using homebrew
* Install [Git Credential Manager Core](https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git), which should prompt you to sign in during the setup process. If you're not, it should happen the first time you clone a repository with `https` in the URI
* Prompt you to configure git `user.name` and `user.email` globally
* Create a directory called `code` in the directory your terminal was in when you ran the script
* Clone the repository where you're reading this README
* Use the `Brewfile` from the repository to install things -- check out the brewfile to see what will be installed
* Install [Oh-My-Zsh](https://ohmyz.sh/)
* Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* Copy the `.zshrc` from this repo to `~/.zshrc`
* Install VSCode extensions [with the command line](https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management). You can find the extensions that will be installed in `vscode-extensions.txt`
* Create the VSCode `settings.json` if it does not exist and copy the `settings.json` from this repo to the appropriate location
* Clone my local testing [jaffle_shop](https://github.com/erika-e/jaffle_shop) dbt project and append a `jaffle_shop` profile to your profiles.yml if it already existed

## Run the setup script

> 🚧   **Danger Zone**
>
> Make sure you're good with everything above before you proceed. Since the setup script was intended for new mac setup, it assumes it can overwite files. Make backups if you are unsure about anything.

I copied it from the repo in a browser window and pasted it straight into the
iTerm2 Rosetta terminal

## Manual steps

I didn't get docker to install from brew, though some folks
[say they have](https://stackoverflow.com/questions/67010057/how-to-run-docker-on-apple-silicon-m1)
I went to the [Docker website](https://docs.docker.com/desktop/mac/apple-silicon/)
and installed it manually.

## Keeping things updated

As you work, you may want to continue to customize these files for your purposes.
I've added two scripts that will help keep things up to date so I don't have to
remember and run shell commands all the time.

### `update_dotfiles.sh`

This script copies dotfiles, settings, and your Brewfile from your local machine
to the local repository. This won't commit the changes -- that's intentional! This
gives you time to check them out and make sure everything looks good.

Use this script if you've made changes while working to make your setup more
efficient and effective.

Here's what `update_dotfiles.sh` will do:

* Set your working directory to `~/code/dotfiles`
* Update your `Brewfile`
* Update everything that's installed
* Copy your local `~/.zshrc` to the repo's `.zshrc`
* Update the list of installed VSCode extensions
* Update `settings.json` with your VSCode settings

The first time you run it, you need to run `chmod +x update_dotfiles.sh`, after
that you'll be able to run `./update_dotfiles.sh` to run the script

### `update_local.sh`

This script installs the programs specified by your Brewfile and copies the
settings from the dotfiles repo to your machine.

Here's what `update_local.sh` will do:

* Set your working directory to `~/code/dotfiles`
* Pull from the dotfiles remote
* Install the dependencies from the `Brewfile`
* Overwite and source `~/.zshrc`
* Install extensions for VSCode
* Overwite and `settings.json`

## Future Enhancements

I'd love pull requests!

## Below This Point Are Working Notes

Current state:

* Installs homebrew
* Installs git from the command line with brew
* Installs brewfile dependencies
* Installs oh my zsh
* Fixed zsh-autosuggestions
* Installs the VSCode extensions
* Updates VSCode settings
* Create a test dbt project

Things to do:

* Revisit VS code Settings
* Do some dbt work and finish fleshing out aliases etc in .zshrc

## Resources I looked at along the way

* [Brew bundle quick guide](https://tomlankhorst.nl/brew-bundle-restore-backup/)
* [Parsing text file arguements to commands](https://unix.stackexchange.com/questions/149726/how-to-parse-each-line-of-a-text-file-as-an-argument-to-a-command)
* [Get dbt up and running from the command line on a MacBook with an M1 chip](https://discourse.getdbt.com/t/get-dbt-up-and-running-from-the-command-line-on-a-macbook-with-an-m1-chip/2908)
* [GClunies dotfile repo](https://github.com/GClunies/.dotfile)
* [Moncef Belyamani automating new mac setup](https://www.moncefbelyamani.com/automating-the-setup-of-a-new-mac-with-all-your-apps-preferences-and-development-tools/)
* [tannerbeam dotfile repo](https://github.com/tannerbeam/dotfiles)
* [Docker on an M1 Mac](https://til.simonwillison.net/macos/running-docker-on-remote-m1)
* [Setting up VSCode to use with the dbt CLI](https://discourse.getdbt.com/t/setting-up-vscode-to-use-with-the-dbt-cli/3291)
* [VS Code Help Docs](https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management)
* [`code` command not working](https://stackoverflow.com/questions/29955500/code-not-working-in-command-line-for-visual-studio-code-on-osx-mac)
* [Brewfile Best Practices](https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f)

The resources above shaped my thinking and choices in this repo. As is usual in programming, I also consulted approx 1 million billion stack overflow posts.
