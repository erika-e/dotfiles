# dotfiles

Analytics engineering dotfiles for an M1 macbook. This assumes you want to use
VSCode for your development environment.

## To set up a brand new M1 Macbook

### Do the basics then install iTerm2

Open your new mac and go through all the setup screens - this takes a little
while. Once complete, you'll need to download and install [iTerm2](https://iterm2.com/).

I got a popup on install that notified me that the pip3 commmand requires the
command line developer tools. I chose install to allow the installation of the
developer tools.

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
* Enables the [git plugin](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) for Oh-My-Zsh, see the link for the aliases this will install
* Symlink the `.zsh` files in `oh-my-zsh` to the appropriate directory for Oh My Zsh to source them
* Install VSCode extensions [with the command line](https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management). You can find the extensions that will be installed in `vscode-extensions.txt`
* Create the VSCode `settings.json` if it does not exist and copy the `settings.json` from this repo to the appropriate location
* Clone my local testing [jaffle_shop](https://github.com/erika-e/jaffle_shop) dbt project and append a `jaffle_shop` profile to your profiles.yml if it already existed. See the repo README for instructions on testing your dbt setup with this project.

## Run the setup script

> 🚧   **Danger Zone**
>
> Make sure you're good with everything above before you proceed. Since the
setup script was intended for new mac setup, it assumes it can overwrite files.
Make backups if you are unsure about anything.

I copied the code from `setup_mac.sh` from the repo in a browser window and
pasted it straight into the iTerm2 Rosetta terminal.

## Manual steps

I didn't get docker to install from brew, though some folks
[say they have](https://stackoverflow.com/questions/67010057/how-to-run-docker-on-apple-silicon-m1)
I went to the [Docker website](https://docs.docker.com/desktop/mac/apple-silicon/)
and installed it manually.

Python dependency management is one of those things everyone does differently.
I've included the `requirements.txt` file I used for my initial setup, but I
didn't add it to the updating shell scripts. You can modify this repo to use
your preferred dependency management solution. I have my VSCode Settings
configured to auto-format with [black](https://github.com/psf/black). If you
don't want this, remove the settings related to black from `settings.json`.

## What I can't Get Working on M1

### pgloader

I tried installing [pgloader](https://github.com/dimitri/pgloader). I was able
to get it to install with Homebrew, but I wasn't able to get it to run. There is
an [open issue](https://github.com/dimitri/pgloader/issues/1312) for it on the
pgloader repo.

## Keeping things updated

As you work, you may want to continue to customize these files for your purposes.
I've added two scripts that will help keep things up to date so I don't have to
remember and run shell commands all the time.

### Updating Oh-My-Zsh Aliases and Functions

Oh-My-Zsh looks for aliases in `.zshrc` and in `*.zsh` files in `~/.oh-my-zsh/custom`.
I started out with all my aliases in `.zshrc`, but finding the right place in
the file got annoying.

The alias files are located in `dotfiles/oh-my-zsh` and are organized by tool.
The setup script symlinks them to the `~/.oh-my-zsh/custom` directory. Changes
made to the files in either directory will update the file in the other directory.

You'll still need to commit changes back to the dotfiles repo. If you change
`~/.oh-my-zsh/custom/dbt.zsh` the file in `../dotfiles/oh-my-zsh/dbt.zsh` will
reflect those changes and git will notice that it has been modified.

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
that you'll be able to run `source ./update_dotfiles.sh` to run the script.

> 🤨 `source ./my_script.sh` or `./my_script.sh` ?
>
> To source `.zshrc` you need to be running the shell script in zsh. Use the
> `source` command to be sure the script will run in zsh, not bash.

### `update_local.sh`

This script installs the programs specified by your Brewfile and copies the
settings from the dotfiles repo to your machine.

Here's what `update_local.sh` will do:

* Set your working directory to `~/code/dotfiles`
* Pull from the dotfiles remote
* Install the dependencies from the `Brewfile`
* Overwrite and source `~/.zshrc`
* Install extensions for VSCode
* Overwrite your local `settings.json` with `settings.json` from the repo

## What's in this Repository

| File | Associated With | Short Description | Requires |
| --- | --- | --- | --- |
| `.zshrc` | zsh, Oh-My-Zsh | Z-shell resource file, runs every time zsh is started. Contains plugins, aliases, functions | Oh-My-Zsh |
| `Brewfile` | Homebrew | File listing packages and programs installed by Homebrew | Homebrew |
| `vscode/extensions.txt` | VS Code | File listing extensions to install for VS Code | VSCode, `code` command line tools |
| `vscode/settings.json` | VS Code | Settings file for VSCode | VSCode, the extensions listed in `vscode-extensions.txt` |
| `dbt/profiles.yml` | dbt | Sample `profiles.yml` file, see [dbt docs](https://docs.getdbt.com/dbt-cli/configure-your-profile) for more | dbt |
| `dbt/packages.yml` | dbt | Sample `packages.yml` file. This contains the packages I always want when working with dbt | dbt |
| `dbt/audit_helper_template.sql` | dbt-audit-helper | A template file that works with a custom shell function to make audit helper ez-peasy | dbt, dbt-audit-helper |
| `python/requirements.txt` | Python | Packages to install globally for Python, not required and not installed automatically by the setup script. Included for reference. | Python |

## Design Decisions

| Choice | Alternatives | Rationale |
| --- | --- | --- |
| Free over paid | e.g. DBeaver over Datagrip | Not everyone has the means to pay for software for learning or personal development |
| Use VSCode | [Atom](https://discourse.getdbt.com/t/how-we-set-up-our-computers-for-working-on-dbt-projects/243), Sublime, vim | I do most of my day to day dbt work in VSCode. It makes sense to stick with the editor I'm familiar with. VSCode is fairly popular with dbt users |
| Use the "standard" [git aliases in Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git) | Other aliases, make up my own | Aligning to a standard that makes a large number of people happy is always a good idea. Looks like these cover a lot of bases. |
| Subdirectories for organization | All files in root | Looks like the vast majority of dotfiles introduce organization at some point. I started with all files in root and realized subdirectories help with understanding what each file is doing |
| Custom shell scripts for updates | [dotfile utilities](https://dotfiles.github.io/utilities/) | For now, I'm choosing to keep things simple. These scripts aren't huge yet so they're still easy to follow. If there were many more tools or if I needed rules for different situations, that might change |
| Symlink Oh-My-Zsh custom aliases | All in `.zshrc`, update with shell script, dotfile utilities | I am honestly not sure this was the right choice yet! At the time, it seemed simpler than the alternatives. There are some potential downsides to symlinking, like broken links and the need to keep links updated. |
| Include a dbt project | Don't include a dbt project | I'm using an M1 Mac, and I wanted to know that dbt was doing exactly what it's supposed to do. Not everyone will be setting up a computer in a context where they have a dbt project ready to go for verifying their setup |
| Include Jekyll | Don't include Jekyll | Most people working on normal analytics engineering work won't need this. I put the installation in a separate script, but kept it in the same repo. |
| Install Python with Homebrew | Anaconda, virtual environments, others | I haven't had issues with this approach, yet. I chose it for simplicity. I want Homebrew to manage as many of the installations and updates as possible |
| Install dbt with Homebrew | Install dbt with pip | Homebrew is what [dbt recommends](https://docs.getdbt.com/dbt-cli/installation) and I haven't had issues |
| Put dotfiles in a directory called code | Put dotfiles in home, or wherever user chooses | I like to keep all my repos in one directory, `~/code`. I find this convenient when I'm navigating around from the command line. This is a habit thing and not a decision based on a best practice. |

## Future Enhancements

I'd love pull requests! I've added a few issues for things I noticed while
putting this together that I haven't had a chance to look at or improve.

## Resources I looked at along the way

* [Brew bundle quick guide](https://tomlankhorst.nl/brew-bundle-restore-backup/)
* [Parsing text file arguments to commands](https://unix.stackexchange.com/questions/149726/how-to-parse-each-line-of-a-text-file-as-an-argument-to-a-command)
* [Get dbt up and running from the command line on a MacBook with an M1 chip](https://discourse.getdbt.com/t/get-dbt-up-and-running-from-the-command-line-on-a-macbook-with-an-m1-chip/2908)
* [GClunies dotfile repo](https://github.com/GClunies/.dotfile)
* [Moncef Belyamani automating new mac setup](https://www.moncefbelyamani.com/automating-the-setup-of-a-new-mac-with-all-your-apps-preferences-and-development-tools/)
* [tannerbeam dotfile repo](https://github.com/tannerbeam/dotfiles)
* [Docker on an M1 Mac](https://til.simonwillison.net/macos/running-docker-on-remote-m1)
* [Setting up VSCode to use with the dbt CLI](https://discourse.getdbt.com/t/setting-up-vscode-to-use-with-the-dbt-cli/3291)
* [VS Code Help Docs](https://code.visualstudio.com/docs/editor/extension-marketplace#_command-line-extension-management)
* [`code` command not working](https://stackoverflow.com/questions/29955500/code-not-working-in-command-line-for-visual-studio-code-on-osx-mac)
* [Brewfile Best Practices](https://gist.github.com/ChristopherA/a579274536aab36ea9966f301ff14f3f)
* [VS Code Extensions for Working with dbt](https://gist.github.com/swanderz/5cf876d88c7c8d268d8c1e1e5d05bffd)
* [dbt Discourse on Configuring VS Code](https://discourse.getdbt.com/t/setting-up-vscode-to-use-with-the-dbt-cli/3291)
* [Managing your dotfiles](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)
* [Dotfiles are Meant to Be Forked](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/)
* [oh-my-zsh and persistent aliases](https://stephencharlesweiss.com/oh-my-zsh-and-persistent-aliases)
* [GitHub dotfiles page](https://dotfiles.github.io/)

The resources above shaped my thinking and choices in this repo. As is usual in
programming, I also consulted approx 1 million billion stack overflow posts.
