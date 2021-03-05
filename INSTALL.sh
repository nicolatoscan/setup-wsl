#!/bin/bash

# launch command
# sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/nicolatoscan/setup-wsl/master/INSTALL.sh)"

# apt
echo "apt install ..."
apt upgrade -y
apt autoremove -y
apt install build-essential mc jq nodejs curl wget git nano mc htop sudo bash zsh python3 python3-pip -y

# oh-my-zsh
echo "Installing oh-my-zsh ..."
yes | sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Setting up oh-my-zsh ..."
# theme
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# config
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i 's/^plugins=.*/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc
wget https://raw.githubusercontent.com/nicolatoscan/setup-wsl/master/.p10k.zsh -O /.p10k.zsh
echo "# To customize prompt, run \`p10k configure\` or edit ~/.p10k.zsh." >> ~/.zshrc
echo "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh" >> ~/.zshrc
# alias
echo "alias py=\"python3\"" >> ~/.zshrc
echo "alias cdw=\"cd /mnt/c/Users/toscan/\"" >> ~/.zshrc

# node
echo "Installing node stuff ..."
curl -fsSL https://deb.nodesource.com/setup_15.x | sudo -E bash -
apt install nodejs -y
npm install typescript

# python
echo "Installing python stuff ..."
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -


echo "apt upgrade di sicurezza ..."
apt update
apt upgrade -y
apt autoremove -y
