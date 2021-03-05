#!/bin/bash

# apt
apt update
apt upgrade -y
apt autoremove -y
apt install build-essential mc jq nodejs curl wget git nano mc htop sudo bash zsh -y

# node
curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
apt install nodejs -y
npm install typescript

# oh-my-zsh
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# config
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc

# TODO: get file .p10k.zsh
wget .p10k.zsh

echo "# To customize prompt, run \`p10k configure\` or edit ~/.p10k.zsh." >> ~/.zshrc
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc
echo "alias py=\"python3\"" >> ~/.zshrc
echo "alias cdw=\"cd /mnt/c/Users/toscan/\"" >> ~/.zshrc
