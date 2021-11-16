# setup_mac.sh

# Inspiration: https://github.com/GClunies/.dotfile/blob/master/analytics_eng_setup/analytics_eng_setup_mac.sh

# Install homebrew
# https://brew.sh/
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install git to get the brewfile
brew install git

# Install git credential manager
brew tap microsoft/git
brew install --cask git-credential-manager-core

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

# Copy and source ~/.zshrc
cp .zshrc ~/.zshrc


# Install Extensions for VS Code
# https://unix.stackexchange.com/questions/149726/how-to-parse-each-line-of-a-text-file-as-an-argument-to-a-command
# < file tr '\n' '\0' | xargs -0 -I{} command --option {} this shell script can do it

## Configure Git Globally
git config --global user.name 'erika-e'
git config --global user.email 'erika.e.pullum@gmail.com'