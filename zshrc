# If you come from bash you might have to change your $PATH.
KUBE_EDITOR="vim"

export HELPDIR='/usr/share/zsh/help'
alias help=run-help

export PATH=$HOME/bin:/usr/local/bin:$PATH
  #
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/Work/Go
export CPPFLAGS=-I/usr/local/opt/openssl/include
export LDFLAGS=-L/usr/local/opt/openssl/lib

export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#
#
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# 
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm pj zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
 alias lg='lazygit'
 alias d='degit'
 alias zshconfig="vim ~/.zshrc"
 alias ohmyzsh="vim ~/.oh-my-zsh"
 alias vim="nvim"
 alias vi="nvim"
 alias gs="git status"
 alias k="kubectl"
alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"
kcn(){
   # connect to the right cluster
   gcloud container clusters get-credentials $1
   #connect to the right namespace 
   kubectl config set-context `kubectl config current-context` --namespace=$2
}

kn(){
    #connect to the right namespace
     kubectl config set-context `kubectl config current-context` --namespace=$1
}

kdp(){
 kubectl get pods --show-all=true | grep 'Evicted' |awk '{print $1}' | xargs kubectl delete pod
}

export MONGO_PATH=/usr/local/Cellar/mongodb/3.4.1
export COMPOSER_PATH=~/.composer/vendor/bin
export CARGO_PATH=~/.cargo/bin
export PATH=$PATH:$MONGO_PATH/bin:$COMPOSER_PATH
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
export PROJECT_PATHS=~/Work
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$CARGO_PATH:$PATH

#
#
#tinycareterminal https://github.com/notwaldorf/tiny-care-terminal
alias tct="tiny-care-terminal"
export TTC_BOTS='tinycarebot,selfcare_bot,magicrealismbot'
export TTC_REPOS='/Users/obeng/Work/current,/Users/obeng/Work/studytime,/Users/obeng/Work/contribute'
export TTC_REPOS_DEPTH=2
export TTC_SAY_BOX='ironman'
export TTC_GITBOT='gitlog'
export TTC_UPDATE_INTERVAL=20
export TTC_TERMINAL_TITLE=false
export TTC_WEATHER='Accra, Ghana'
export TTC_POMODORO=50
export TTC_TERMINAL_TITLE=false
export TTC_APIKEYS=false
export TTC_BREAK=15
#
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/obeng/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/obeng/google-cloud-sdk/path.zsh.inc'; fi
alias git=hub

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
#
#kube-ps1
source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1
# added by Anaconda3 2019.10 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/opt/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
export PATH=$HOME/.gem/ruby/2.6.3.p62/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH

[ -f "/Users/obeng/.shopify-app-cli/shopify.sh" ] && source "/Users/obeng/.shopify-app-cli/shopify.sh"

eval "$(pyenv init -)"

autoload -Uz tetriscurses

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
