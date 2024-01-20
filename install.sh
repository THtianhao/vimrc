#!/bin/bash

sudo apt-get update
sudo apt-get install git tmux unzip wget -y
echo "安装npm nodejs"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "安装npm nodejs完成"
echo "安装git lfs"
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs -y
echo "安装git lfs 完成"

# 安装 Oh My Zsh
echo "y" | sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" <<< "y"
# 切换 Zsh 主题为 ys
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="ys"/' ~/.zshrc
echo 'alias gpush="git add . && git commit -m '\''Auto update'\'' && git push"' >> ~/.zshrc
echo 'alias de="deactivate"' >> ~/.zshrc
echo 'alias cda="conda deactivate"' >> ~/.zshrc
echo 'alias act="source ./venv/bin/activate"' >> ~/.zshrc

# 使主题更改生效
source ~/.zshrc

echo "配置tmux"
# Add mouse mode configuration to ~/.tmux.conf
echo "# 鼠标模式开启，用于支持鼠标滚轮" >> ~/.tmux.conf
echo "set -g mouse on" >> ~/.tmux.conf
echo "" >> ~/.tmux.conf
echo "# 鼠标滚轮在 copy 模式下也能使用" >> ~/.tmux.conf
echo "set -g mouse-select-pane on" >> ~/.tmux.conf
echo "set -g mouse-select-window on" >> ~/.tmux.conf
echo "set -g mode-mouse on" >> ~/.tmux.conf

echo "tmux 配置已更新。"
tmux source-file ~/.tmux.conf



echo "vim 插件安装"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cp ~/vimrc/.vimrc ~/.vimrc
vim +PlugInstall +qall
echo "vim插件安装完成"

echo "conda 安装"
mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh
~/miniconda3/bin/conda init zsh
source ~/.zshrc
echo "conda 安装完成"

echo "设置ssh超时时间"
# 检查是否是root用户，如果不是，则使用sudo获取权限
if [ "$EUID" -ne 0 ]; then
    SUDO=sudo
fi

# 修改sshd_config文件，禁用自动断开连接
$SUDO sed -i 's/^#ClientAliveInterval 0/ClientAliveInterval 300/' /etc/ssh/sshd_config
$SUDO sed -i 's/^#ClientAliveCountMax 3/ClientAliveCountMax 0/' /etc/ssh/sshd_config

# 重启SSH服务以应用更改
$SUDO service ssh restart
echo "ssh超时设置成功"
cd