# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.

export HOME_PATH
if [[ "$(uname)" == "Darwin" ]]; then
  # Mac系统
  export HOME_PATH="/Users/toto"
  export HOMEBREW_NO_AUTO_UPDATE=true
else
  # 其他系统
  export HOME_PATH="/home/ubuntu"
fi

add_to_path() {
    case ":$PATH:" in
        *":$1:"*) ;;
        *) PATH="$1:$PATH" ;;
    esac
}

export HOME=$HOME_PATH
export ZSH=$HOME/.oh-my-zsh
export USE_CCACHE=1

add_to_path "/usr/local/bin"
add_to_path "$HOME/.local/bin"
add_to_path "$HOME/.cargo/bin"
add_to_path "/opt/local/bin"
add_to_path "/usr/local/sbin"
add_to_path "/opt/homebrew/opt/llvm/bin"


source $HOME/vimrc/zsh_ai
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
plugins=(git)
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


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
