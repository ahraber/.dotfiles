# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/arx/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="random"
ZSH_THEME="gentoo"

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
# export LANG=en_US.UTF-8

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

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'

# Programs
alias leaf='screen -d -m leafpad'
alias wireshark='screen -d -m wireshark-gtk'
alias npp='wine64 .wine/drive_c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe &'
alias vi='vim'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

# Package Managemnet
alias pac='sudo pacman -Sy'
alias aur='yaourt -aSy'
alias pkr='/bin/bash ~/packer/packer'

alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'


# Git
gitter() {
    git status; git pull; git add * && git add *.*.*; git commit -m "`echo $1`"; git push; git status;
}

# Dotfiles
dotpush() {
  pushd ~/.dotfiles; gitter "`echo $1`"; popd;
}


# Power
alias reboot='sudo shutdown -r now'
alias shutdown='sudo shutdown'

# Network
alias mtr='mtr -i 5 -o SRDLNBAVGJMXI'

# Other
alias virc='vi ~/.zshrc'
alias src='. ~/.zshrc'

# Work
alias syn='killall synergys && /usr/bin/synergys -c ~/.synergy.conf && ssh alex@10.0.0.114 "sudo killall synergy* && synergyc 10.0.0.101"'
WORKTOP='alex@10.0.0.114'
#alias work='ssh -A alex@10.0.0.114'
alias work='ssh -A `echo $WORKTOP`'
alias pingw='ping -W 60 -i .2 -c 3600 10.0.0.114'

function workstat() {
  if [ pingw ]; then
    if work "fping -I tun0 10.64.24.8"; then
      echo "work vpn established"
    else
      echo "work vpn down, reconnecting"
      if work "/bin/bash /home/alex/scripts/vpn.sh"; then
        echo "work vpn established"
      else
        echo "work vpn not establishing" 
      fi
    fi
  else
    echo "work laptop unavailable"
  fi
}

# Add colors for filetype and  human-readable sizes by default on 'ls':
alias ls='ls -lah --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
