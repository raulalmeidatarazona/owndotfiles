# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git 
         zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='lsd'
alias l.='ls -lF -d  .*' ##solo que empicen por .##
alias lsa='lsd -lah'
alias l='lsd -lah'
alias lat='lsd -lah --tree'
alias ll='lsd -lh'
alias la='lsd -lAh'
alias cdw='cd $HOME/Workspace'
alias cde='cd $HOME/Exoticca'
alias cat='bat'
alias i.='(phpstorm $PWD &>/dev/null &)'
alias c.='(code $PWD &>/dev/null &)'
alias o.='(open $PWD &>/dev/null &)'
alias up='brew update && brew upgrade'
alias dl='docker_list'
alias dp='docker_prune'
alias dco='docker_connect'
alias gac='amend_commit'
alias start-dev-ec2='aws ec2 start-instances --instance-ids i-00a48572387ed87f7 --region eu-south-2'
alias stop-dev-ec2='aws ec2 stop-instances --instance-ids i-00a48572387ed87f7 --region eu-south-2'
alias status-dev-ec2='aws ec2 describe-instances --instance-ids i-00a48572387ed87f7 --query "Reservations[].Instances[].State.Name" --region eu-south-2'
alias remote-tunnel='sudo -E ssh -F ~/.ssh/config -i ~/.ssh/PRO-Exoticca-key.pem -l ubuntu 10.103.3.66 -vNL 127.0.0.1:80:10.103.3.66:8080'

function docker_list() {
containers=$(docker ps | awk '{if (NR!=1) print $1 ": " $(NF)}')
echo "👇 Containers 👇"
echo $containers
}

function docker_prune(){
    echo "Stopping all running containers..."
    docker stop $(docker ps -q)
    
    echo "Removing all containers..."
    docker rm $(docker ps -a -q)
    
    echo "Removing all images..."
    docker rmi $(docker images -q)
    
    echo "Removing all volumes..."
    docker volume rm $(docker volume ls -q)
    
    echo "Removing all networks..."
    docker network rm $(docker network ls -q)
    
    echo "Pruning the system..."
    docker system prune -af
    
    echo "Docker purge completed."
}

function docker_connect(){
	if docker ps >/dev/null 2>&1; then
  container=$(docker ps | awk '{if (NR!=1) print $1 ": " $(NF)}' | fzf --height 40%)

  if [[ -n $container ]]; then
    container_id=$(echo $container | awk -F ': ' '{print $1}')

    docker exec -it $container_id /bin/bash || docker exec -it $container_id /bin/sh
  else
    echo "You haven't selected any container! ༼つ◕_◕༽つ"
  fi
else
  echo "Docker daemon is not running! (ಠ_ಠ)"
fi
}


function amend_commit(){
    echo "Añadiendo cambios al área de preparación..."
    git add .
    if [ $? -eq 0 ]; then
        echo "Cambios añadidos correctamente."
    else
        echo "Error al añadir cambios."
        exit 1
    fi

    echo "Modificando el último commit..."
    git commit --amend --no-edit
    if [ $? -eq 0 ]; then
        echo "Commit modificado correctamente."
    else
        echo "Error al modificar el commit."
        exit 1
    fi

    echo "Forzando el push al repositorio remoto..."
    git push --force
    if [ $? -eq 0 ]; then
        echo "Push realizado correctamente."
    else
        echo "Error al realizar el push."
        exit 1
    fi
}


_reverse_search() {
  local selected_command=$(fc -rl 1 | awk '{$1="";print substr($0,2)}' | fzf)
  LBUFFER=$selected_command
}

zle -N _reverse_search
bindkey '^r' _reverse_search
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform
