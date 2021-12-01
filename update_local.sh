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

# .zsh files in dotfiles/oh-my-zsh have remote changes because they are symlinked
# files removed from the remote will remain in the ~/.oh-my-zsh/custom directory
# unless they are removed
# To remove files you no longer want, use 
# rm ~/.oh-my-zsh/custom/file-to-remove.zsh
# To remove all symlinks in the oh-my-zsh/custom directory use
# find ~/.oh-my-zsh/custom -type l | xargs rm

# Install dependencies from Brewfile
brew bundle install

# Copy and source ~/.zshrc
cp .zshrc ~/.zshrc
source ~/.zshrc

# Install extensions for VSCode
# https://unix.stackexchange.com/questions/149726/how-to-parse-each-line-of-a-text-file-as-an-argument-to-a-command
# < file tr '\n' '\0' | xargs -0 -I{} command --option {} this shell script can do it
< vscode/vscode-extensions.txt tr '\n' '\0' | xargs -0 -I{} code --install-extension {}

# Copy the template settings file to the system location
cp vscode/settings.json "$HOME/Library/Application Support/Code/User/settings.json"