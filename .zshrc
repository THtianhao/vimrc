# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export HOME=/Users/toto
export SUB_HOME=/Volumes/Samsung_T5
export COMPANY=$HOME/project/company
export ZSH=$HOME/.oh-my-zsh
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export USE_CCACHE=1

export CFLAGS=-I/usr/local/Cellar/icu4c/$ICU_VERSION/include
export LDFLAGS=-L/usr/local/Cellar/icu4c/$ICU_VERSION/lib

#maven
export PATH=$HOME/software/apache-maven-3.6.0/bin:$PATH
#go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH
#flutter
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
export PATH=$PATH:$HOME/Library/flutter/bin
export FLUTTER_HOME=$HOME/Library/flutter
export FVM_HOME=$HOME/Library/fvm

#android
export ANDROID_NDK_R21=$HOME/Library/Android/sdk/ndk/21.4.7075529
export PATH=$PATH:$ANDROID_NDK_R21
export ANDROID_NDK=$SUB_HOME/Library/Android/sdk/ndk
export ANDROID_SDK=$SUB_HOME/Library/Android/sdk
export ANDROID_HOME=$SUB_HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/ndk-bundle/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin
#firebase
export PATH=$PATH:$HOME/.pub-cache/bin
#ant
export PATH=${PATH}:${ANT_HOME}/bin
#java
export ANT_HOME=$HOME/Project/openResource/apache-ant-1.10.6
export JAVA_11_HOME=/Library/Java/JavaVirtualMachines/jdk-11.0.16.1.jdk/Contents/Home
export JAVA_9_HOME=/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home
export JAVA_8_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_281.jdk/Contents/Home
export JAVA_7_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export JAVA_HOME=$JAVA_11_HOME
export PATH=$PATH:$JAVA_HOME
#python
export PYTHONDONTWRITEBYTECODE=1 # python禁止生成缓存文件
export PATH=/Library/Frameworks/Python.framework/Versions/3.10/bin:$PATH

#mysql
export PATH=/usr/local/mysql/bin:$PATH
export PATH=/usr/local/opt/bison/bin:$PATH
#vim
export PATH=$PATH:/usr/local/opt/vim
#llvm
export PATH=$PATH:/usr/local/opt/llvm/bin

#nodejs
export NVM_DIR="/Users/toto/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#openai
export OPENAI_API_KEY="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"

alias jdk7='export JAVA_HOME=$JAVA_7_HOME'
alias jdk8='export JAVA_HOME=$JAVA_8_HOME'
alias jdk9='export JAVA_HOME=$JAVA_9_HOME'
alias jdk11='export JAVA_HOME=$JAVA_11_HOME'

alias ip='ifconfig | grep 10.6'
alias zshrc='vi ~/.zshrc'
alias vimrc='vi ~/.vimrc'
alias gpush="git add . && git commit -m 'Auto update' && git push"
alias ip='ifconfig|grep 10.60'
alias act="source venv/bin/activate"
alias cda="conda deactivate"
alias gpush="g add . && g commit -m 'Auto update' && g push"
set the number of open files to be 1024
ulimit -S -n 1024
#Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/toto/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/toto/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/toto/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/toto/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border' # 最新的历史记录排到最上，窗口大小等
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
