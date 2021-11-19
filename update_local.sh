# update_local.sh

# This shell script matches the local configuration to the dotfiles repo
# It should be run within the dotfiles repo

# 🚧  Warning: this will overwrite your local settings and clean up your brew configuration
# Make sure you really want to do that before running this script

# Make sure you're in the right place 
cd ~/code/dotfiles
echo $PWD
echo "Updating local configuration to match dotfiles repo"

# Make sure you have the latest
git pull --rebase

# Install dependencies from Brewfile
brew bundle install

# Future enhancement - remove no longer needed from system if not in Brewfile
# First attempt removed stuff, maybe?

# Copy and source ~/.zshrc
cp .zshrc ~/.zshrc
source ~/.zshrc

# Install extensions for VSCode
# https://unix.stackexchange.com/questions/149726/how-to-parse-each-line-of-a-text-file-as-an-argument-to-a-command
# < file tr '\n' '\0' | xargs -0 -I{} command --option {} this shell script can do it
< vscode-extensions.txt tr '\n' '\0' | xargs -0 -I{} code --install-extension {}

# Copy the template settings file to the system location
cp settings.json "$HOME/Library/Application Support/Code/User/settings.json"