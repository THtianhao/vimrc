#!/bin/bash
echo -n "请输入用户目录: "
read user_directory
if [ ! -d "$user_directory" ]; then
    echo "错误：目录不存在或不可访问。"
    exit 1
fi
sed -i "s|^export HOME=.*$|export HOME=$user_directory|" .zshrc
echo "已成功修改 .zsh 脚本中的 export HOME 行为：export HOME=$user_directory"

sudo apt-get update
sudo apt-get install git tmux unzip wget -y
git config --global user.email "tototianhao@gmail.com"
git config --global user.name "toto"
echo "安装npm nodejs"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
echo "安装npm nodejs完成"
echo "安装git lfs"
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs -y
echo "安装git lfs 完成"
echo "安装fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all <<< 'yyy'

echo "安装fzf 完成"
if [ -d ~/.oh-my-zsh ]; then
    echo "Oh My Zsh 已安装，跳过安装步骤"
else
    # 安装 Oh My Zsh
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" <<< "y"
fi

echo "ln zsh"
if [ -f ~/.zshrc ]; then
    rm ~/.zshrc
    echo ".zshrc 文件已存在，删除"
fi
ln -s ~/vimrc/.zshrc ~/.zshrc

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

echo "ln .vimrc"
if [ -f ~/.vimrc ]; then
    rm ~/.vimrc
    echo ".vimrc 已存在删除"
fi
ln -s ~/vimrc/.vimrc ~/.vimrc

vim +PlugInstall +GoInstallBinaries +qall
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
