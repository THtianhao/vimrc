#!/bin/bash

current_shell=$(basename "$SHELL")

# 检查当前系统是否是 Linux 并进行操作
if [[ "$(uname -s)" == "Linux" ]]; then
    echo "当前系统是 Linux"
    if [[ "$current_shell" != "zsh" ]]; then
        echo "当前 Shell 不是 Zsh，准备修改密码并切换到 Zsh..."
        
        echo -n "请输入新的主机名: "
        read new_hostname
        if [ -z "$new_hostname" ]; then
            echo "错误：主机名不能为空"
            exit 1
        fi
        sudo hostnamectl set-hostname "$new_hostname"
        echo "主机名已更改为 $new_hostname"
        # 修改当前用户密码
        current_user=$(whoami)
        sudo passwd "$current_user"

        # 安装并切换到 Zsh
        if ! command -v zsh &>/dev/null; then
            echo "安装 Zsh..."
            sudo apt-get install zsh -y
        else
            echo "Zsh 已安装，跳过安装步骤"
        fi

        echo "切换到 Zsh..."
        chsh -s "$(which zsh)"
        echo "请重新登录以应用 Zsh 设置"
        exit 0
    else
        echo "当前 Shell 已是 Zsh，无需修改"
    fi
else
    echo "当前系统不是 Linux，无需执行操作"
fi

echo -n "请输入用户目录: "
read user_directory
if [ ! -d "$user_directory" ]; then
    echo "错误：目录不存在或不可访问。"
    return
fi
sed -i "s|^export HOME=.*$|export HOME=$user_directory|" .zshrc
echo "已成功修改 .zsh 脚本中的 export HOME 行为：export HOME=$user_directory"
export HOME=$user_directory

# 更新 /etc/hosts 文件
if ! grep -q "127.0.0.1 $new_hostname" /etc/hosts; then
    echo "更新 /etc/hosts 文件..."
    sudo sed -i "s/127.0.0.1.*/127.0.0.1 localhost $new_hostname/" /etc/hosts
    echo "127.0.0.1 $new_hostname" | sudo tee -a /etc/hosts > /dev/null
fi

echo "主机名配置已完成！"

# 安装基础工具
sudo apt-get install git tmux unzip wget -y
git config --global user.email "tototianhao@gmail.com"
git config --global user.name "toto"

# 安装 Docker
if ! command -v docker &>/dev/null; then
    echo "安装 Docker..."
    sudo apt-get install ca-certificates curl -y
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
    sudo usermod -aG docker $(whoami)
    exec newgrp docker
    echo "Docker 安装完成"
else
    echo "Docker 已安装，跳过"
fi

# 安装 Node.js 和 npm
if ! command -v node &>/dev/null || ! command -v npm &>/dev/null; then
    echo "安装 Node.js 和 npm..."
    curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
    sudo apt-get install -y nodejs
    sudo npm install -g n
    sudo n 23.2.0
    echo "Node.js 和 npm 安装完成"
else
    echo "Node.js 和 npm 已安装，跳过"
fi

# 安装 git-lfs
if ! git lfs &>/dev/null; then
    echo "安装 git-lfs..."
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
    sudo apt-get install git-lfs -y
    echo "git-lfs 安装完成"
else
    echo "git-lfs 已安装，跳过"
fi

# 安装 fzf
if [ ! -d ~/.fzf ]; then
    echo "安装 fzf..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all <<< 'yyy'
    echo "fzf 安装完成"
else
    echo "fzf 已安装，跳过"
fi

# 安装 Oh My Zsh
if [ -d ~/.oh-my-zsh ]; then
    echo "Oh My Zsh 已安装，跳过安装步骤"
else
    echo "安装 Oh My Zsh..."
    sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" <<< "y"
    echo "Oh My Zsh 安装完成"
fi

# 外链 .zshrc
if [ -f ~/.zshrc ]; then
    rm ~/.zshrc
    echo ".zshrc 文件已存在，删除"
fi
ln -s ~/vimrc/.zshrc ~/.zshrc
source ~/.zshrc
echo "外链 .zshrc 完成"

# 配置 tmux
if ! grep -q "set -g mouse on" ~/.tmux.conf; then
    echo "# 鼠标模式开启，用于支持鼠标滚轮" >> ~/.tmux.conf
    echo "set -g mouse on" >> ~/.tmux.conf
    tmux source-file ~/.tmux.conf
fi

# 安装 vim 插件
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "安装 vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +GoInstallBinaries +qall
    echo "vim 插件安装完成"
else
    echo "vim 插件已安装，跳过"
fi

# 安装 Conda
if [ ! -d ~/miniconda3 ]; then
    echo "安装 Conda..."
    mkdir -p ~/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -rf ~/miniconda3/miniconda.sh
    ~/miniconda3/bin/conda init zsh
    source ~/.zshrc
    echo "Conda 安装完成"
else
    echo "Conda 已安装，跳过"
fi

# 设置 SSH 超时时间
if [ "$EUID" -ne 0 ]; then
    SUDO=sudo
fi
$SUDO sed -i 's/^#ClientAliveInterval 0/ClientAliveInterval 300/' /etc/ssh/sshd_config
$SUDO sed -i 's/^#ClientAliveCountMax 3/ClientAliveCountMax 0/' /etc/ssh/sshd_config
$SUDO service ssh restart
echo "SSH 超时设置成功"
