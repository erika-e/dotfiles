# update_remote.sh

# This shell script copies the local settings from the mac to the dotfiles repo
# It should be run within the dotfiles repo

# Make sure you're in the right place 
cd ~/code/dotfiles
echo $PWD
echo "Updating dotfiles repository with local configuration"

# Update the Brewfile
brew bundle dump --force

# Check if anything in brew is outdated
brew update

echo 
echo "The following are pinned and will be ignored if you upgrade"
brew list --pinned

echo "Listing outdated"
brew outdated

# Ask before upgrading
if read -q "choice?Enter Y/y to upgrade all, or upgrade individually with brew upgrade <formula>: ";
then
    echo "Upgrading brew formulae and casks"
    brew upgrade
    brew cu
else
    echo
    echo "'$choice' not 'Y' or 'y'. Skipping on"
fi

# .zsh files in dotfiles/oh-my-zsh have local changes because they are symlinked
# To remove files you no longer want, use 
# rm ~/.oh-my-zsh/custom/file-to-remove.zsh
# To remove all symlinks in the oh-my-zsh/custom directory use
# find ~/.oh-my-zsh/custom -type l | xargs rm

# Update requirements.txt for Python
pip3 freeze > python/requirements.txt

# Update .zshrc
cp ~/.zshrc .zshrc

# Overwrite the extensions list with the currently installed extensions
code --list-extensions > vscode/extensions.txt

#The lines below uninstall all extensions
# rm -rf ~/.vscode/extensions
# mkdir ~/.vscode/extensions

# Change the order for installation 
# Theses two extensions install their own dependencies and need to go first in order
# https://www.unix.com/shell-programming-and-scripting/238349-move-line-top-file.html
gsed -i '/innoverio.vscode-dbt-power-user/d;1i\innoverio.vscode-dbt-power-user' vscode/extensions.txt 
gsed -i '/ms-python.python/d;1i\ms-python.python' vscode/extensions.txt 

# Overwrite settings.json with the local VSCode settings file
cp "$HOME/Library/Application Support/Code/User/settings.json" vscode/settings.json