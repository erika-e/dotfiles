# dotfiles
Analytics Engineering dotfiles for an M1 Mac

## Setup Steps

Open your new mac and go through all the setup screens - this takes a little while.

Once complete, you'll need iTerm2. Go to https://iterm2.com/ and download it.
When I did this, I got notified that I needed to install:
* Developer tools
* Message about installing pip3
Let's hope neither of those cause problems later

TODO: Add Rosetta Instructions 

## Git Setup 

If you try to run the script as is, you'll get the following error when you try to sign in to github:
`remote: Support for password authentication was removed on August 13, 2021. Please use a personal access token instead.`

To fix this: 
1. Generate a PAT [instructions](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) 
2. Enter it instead of your password when prompted on the command line

