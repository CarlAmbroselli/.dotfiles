# Install Prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Set Zsh as your default shell
chsh -s /bin/zsh

ln -s  "$HOME/.dotfiles/conf/zshtheme/prompt_carl_setup" "$HOME/.zprezto/modules/prompt/functions/prompt_carl_setup" 
