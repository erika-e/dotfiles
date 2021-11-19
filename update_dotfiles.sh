# update_remote.sh

# This shell script copies the local settings from the mac to the dotfiles repo
# It should be run within the dotfiles repo

# Make sure you're in the right place 
cd ~/code/dotfiles
echo $PWD
echo "Updating dotfiles repository with local configuration"

# Update the Brewfile
brew bundle dump --force

# Update everything installed
brew update
brew upgrade
brew cu

# Update .zshrc
cp ~/.zshrc .zshrc

# Overwrite the extensions list with the currently installed extensions
code --list-extensions > vscode-extensions.txt

# Overwrite settings.json with the local VSCode settings file
cp "$HOME/Library/Application Support/Code/User/settings.json" settings.json