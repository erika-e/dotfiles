# setup_jekyll.sh

# Separating jekyll config from other config
# https://jekyllrb.com/docs/installation/macos/

# Install command line tools - uncomment this line if you need it
# xcode-select --install

# Magic required by MacOS Catalina or later
export SDKROOT=$(xcrun --show-sdk-path)

# Update Ruby with brew
brew install ruby

#Update ~/.zshrc with exported path
echo 'export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"' >> ~/.zshrc

# Install jekyll and the bundler
gem install --user-install bundler jekyll

# Update ~/.zshrc again
echo 'export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"' >> ~/.zshrc





