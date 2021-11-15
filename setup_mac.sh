# setup_mac.sh

# Inspiration: https://github.com/GClunies/.dotfile/blob/master/analytics_eng_setup/analytics_eng_setup_mac.sh

# Install homebrew
# https://brew.sh/
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies from Brewfile
brew bundle install

# Add step to install dependencies from Brewfile
# Install OH-MY-ZSH and auto suggestions
# https://ohmyz.sh/
echo
echo
echo "Installing OH-MY-ZSH..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
&& brew install zsh-autosuggestions
echo "Get .zshrc config, saved at location: $HOME/.zshrc..."
# assumes this is running in the repo directory, test this first
#cp .zshrc ~/.zshrc
