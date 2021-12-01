# setup_mac.sh

# Install homebrew
# https://brew.sh/
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install git to get the brewfile
brew install git

# Install git credential manager
brew tap microsoft/git
brew install --cask git-credential-manager-core

## Configure git globally
echo "Configuring git name and email globally "
read  "gitusername?Enter git user.name"
git config --global user.name $gitusername
read  "gituseremail?Enter git user.email" 
git config --global user.email $gituseremail
git config --global init.defaultBranch main

# Create a directory for repos
echo "Creating code directory"
mkdir -p code
cd code

# Remove the dotfiles repo if it already exists and restore from the source
if [ -d dotfiles ]; then rm -rf dotfiles ; fi
git clone https://github.com/erika-e/dotfiles.git
cd dotfiles

# Install dependencies from Brewfile
brew bundle install

# Install OH-MY-ZSH and auto suggestions
# https://ohmyz.sh/

# Check for and install oh-my-zsh if not already installed
if [ -d ~/.oh-my-zsh ]; \
then echo "oh-my, it's already installed" ; \
else echo "oh-my-zsh not installed, installing..." && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" ; \
fi

# Check for and install zsh-autosuggestions
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] ; \
then echo "zsh-autosuggestions is in the house" ; \
else echo "Installing zsh-autosuggestions" && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ; \
fi

# symlink custom alias files from dotfiles to the oh-my-zsh custom folder
ln -s ~/code/dotfiles/oh-my-zsh/*.zsh ~/.oh-my-zsh/custom

# Copy and source ~/.zshrc
cp .zshrc ~/.zshrc
source ~/.zshrc

# Install extensions for VSCode
# https://unix.stackexchange.com/questions/149726/how-to-parse-each-line-of-a-text-file-as-an-argument-to-a-command
# < file tr '\n' '\0' | xargs -0 -I{} command --option {} this shell script can do it
< vscode/vscode-extensions.txt tr '\n' '\0' | xargs -0 -I{} code --install-extension {}

# Create the VSCode settings file
touch "$HOME/Library/Application Support/Code/User/settings.json"

# Copy the template settings file to the system location
cp vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"

# Set up a sandbox dbt project
cd ~/code
if [ -d jaffle_shop ]; then rm -rf jaffle_shop ; fi
git clone https://github.com/erika-e/jaffle_shop.git

# Create a dbt directory if it doesn't exist
mkdir -p ~/.dbt

# Create profiles.yml if it doesn't exist
touch ~/.dbt/profiles.yml

#Append the contents of the sample profiles.yml to the existing profiles.yml
cat dotfiles/profiles.yml >> ~/.dbt/profiles.yml