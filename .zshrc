# If you come from bash you might have to change your $PATH.
KUBE_EDITOR="vim"
export PIPENV_VENV_IN_PROJECT=true
export HELPDIR='/usr/share/zsh/help'
export EDITOR='nvim'
alias help=run-help
alias cc="claude --chrome "
alias ccp="claude -p"
alias ccds="claude --permission-mode=dontAsk --dangerously-skip-permissions"
alias cctl="ls ~/.claude/tasks"
alias gmn="gemini --yolo"
alias chrome-debug="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --remote-debugging-port=9222"
# ============================================================================
# PATH CONFIGURATION - All PATH exports consolidated here
# ============================================================================
# Base paths
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Language-specific paths
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"          # Java
export PATH="/usr/local/opt/php@7.2/bin:$PATH"               # PHP
export PATH="/usr/local/opt/ruby/bin:$PATH"                  # Ruby
export PATH="$HOME/.gem/ruby/2.6.3.p62/bin:$PATH"          # Ruby gems

# Development tools
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"  # Yarn
export PATH="/usr/local/opt/libpq/bin:$PATH"                 # PostgreSQL
export PATH="/Users/pdguest/.local/bin:$PATH"                # Local binaries
export PATH="/Users/pdguest/.duckdb/cli/latest:$PATH"        # DuckDB

# Conditional paths (set after variable definitions)
export MONGO_PATH=/usr/local/Cellar/mongodb/3.4.1
export COMPOSER_PATH=~/.composer/vendor/bin
export CARGO_PATH=~/.cargo/bin

export PATH="$CARGO_PATH:$PATH"                              # Rust/Cargo
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"           # Kubernetes Krew
export PATH="$PATH:$MONGO_PATH/bin:$COMPOSER_PATH"          # MongoDB & Composer
export PATH="$PATH:$(go env GOPATH)/bin"                     # Go binaries
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/Work/Go
export CPPFLAGS=-I/usr/local/opt/openssl/include
export LDFLAGS=-L/usr/local/opt/openssl/lib

export CLOUDSDK_PYTHON_SITEPACKAGES=1
ZSH_THEME_TF_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_TF_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_TF_VERSION_PROMPT_PREFIX="%{$fg[white]%}"
ZSH_THEME_TF_VERSION_PROMPT_SUFFIX="%{$reset_color%}"

#
# Configuration for virtualenv
#
#export WORKON_HOME=$HOME/.virtualenvs
#export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
#source /usr/local/bin/virtualenvwrapper.sh
#export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin" 

#export PATH="/usr/local/bin:$PATH"
##
#
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
plugins=(git npm pj terraform zsh-syntax-highlighting zsh-autosuggestions gcloud)

ZSH_DISABLE_COMPFIX=true

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
 alias ls="eza"
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

export PROJECT_PATHS=~/Work

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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
#
#kube-ps1
# source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
#PROMPT='$(kube_ps1)'$PS1


[ -f "/Users/obeng/.shopify-app-cli/shopify.sh" ] && source "/Users/obeng/.shopify-app-cli/shopify.sh"


autoload -Uz tetriscurses

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true


echo "Beautiful is better than ugly.
Explicit is better than implicit.
Simple is better than complex.
Complex is better than complicated.
Flat is better than nested.
Sparse is better than dense.
Readability counts.
Special cases aren't special enough to break the rules.
Although practicality beats purity.
Errors should never pass silently.
Unless explicitly silenced.
In the face of ambiguity, refuse the temptation to guess.
There should be one-- and preferably only one --obvious way to do it.
Although that way may not be obvious at first unless you're Dutch.
Now is better than never.
Although never is often better than *right* now.
If the implementation is hard to explain, it's a bad idea.
If the implementation is easy to explain, it may be a good idea.
Namespaces are one honking great idea -- let's do more of those!"


export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS=" --walker-skip .git,node_modules,target --layout=reverse --inline-info --preview 'bat -n --color=always {}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_COMPLETION_TRIGGER='**'




# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/pdguest/Work/precis-user-platform/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/pdguest/Work/precis-user-platform/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/pdguest/Work/precis-user-platform/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/pdguest/Work/precis-user-platform/google-cloud-sdk/completion.zsh.inc'; fi
eval "$(uv generate-shell-completion zsh)"
export GOOGLE_APPLICATION_CREDENTIALS='/users/pdguest/.config/gcloud/application_default_credentials.json'

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"



export PATH="$HOME/.local/bin:$PATH"

# Added by Antigravity
export PATH="/Users/pdguest/.antigravity/antigravity/bin:$PATH"

alias pr="gh pr view --web"

# git wt shortcuts – keeping your old ga / gd muscle memory
gwa() {
  git wt $1 $2
}
alias gwd='git wt -d'            # gd my-branch  → safe delete worktree + branch
alias gwD='git wt -D'            # gD my-branch  → force delete (use carefully)

# Extra useful ones (bonus aliases for common patterns)
alias gwl='git wt'              # gwl          → list all worktrees (short for git wt list)
alias gwac='git wt --copyignored' # gwa my-branch → create with .env* copied (overrides config if needed)
alias gwn='git wt --nocd'       # gwn my-branch → create/switch but stay in current dir (no auto cd)

# If you often want to force-copy ignored + untracked files
alias gwall='git wt --copyignored --copyuntracked'
# Add to ~/.zshrc
alias gwapup='cd ~/Work/precis-user-platform && gwa'   # change path to your repo
 alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

eval "$(git wt --init zsh)"
eval "$(direnv hook zsh)"



# bun completions
[ -s "/Users/pdguest/.bun/_bun" ] && source "/Users/pdguest/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
