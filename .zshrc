# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.

export HOME_PATH
if [[ "$(uname)" == "Darwin" ]]; then
  # Mac系统
  export HOME_PATH="/Users/toto"
else
  # 其他系统
  export HOME_PATH="/home/toto"
fi
export HOME=$HOME_PATH
export ZSH=$HOME/.oh-my-zsh
export PATH=/usr/local/bin:$PATH
export PATH=/opt/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export USE_CCACHE=1

[ -f $HOME/vimrc/$(uname)/zsh_go ] && source $HOME/vimrc/$(uname)/zsh_go
[ -f $HOME/vimrc/$(uname)/zsh_android ] && source $HOME/vimrc/$(uname)/zsh_android
[ -f $HOME/vimrc/$(uname)/zsh_flutter ] && source $HOME/vimrc/$(uname)/zsh_flutter
[ -f $HOME/vimrc/$(uname)/zsh_python ] && source $HOME/vimrc/$(uname)/zsh_python
[ -f $HOME/vimrc/$(uname)/zsh_other ] && source $HOME/vimrc/$(uname)/zsh_other
[ -f $HOME/vimrc/$(uname)/zsh_mysql ] && source $HOME/vimrc/$(uname)/zsh_mysql
[ -f $HOME/vimrc/$(uname)/zsh_alias ] && source $HOME/vimrc/$(uname)/zsh_alias
[ -f $HOME/vimrc/$(uname)/zsh_cuda ] && source $HOME/vimrc/$(uname)/zsh_cuda
[ -f $HOME/vimrc/$(uname)/zsh_web3 ] && source $HOME/vimrc/$(uname)/zsh_web3

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


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh


# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# For a full list of active aliases, run `alias`.


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border' # 最新的历史记录排到最上，窗口大小等
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
