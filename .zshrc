#Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# from https://transfer.sh/
transfer() { tmpfile=$( mktemp -t transferXXX ); curl --progress-bar --upload-file $1 https://transfer.sh/$(basename $1) >> $tmpfile; cat $tmpfile; rm -f $tmpfile; } 

#Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# SSH aliases
alias proxy="ssh -D 12345 192.249.63.16"
alias london="ssh root@108.61.221.50"
alias losa="ssh root@107.191.58.26"
alias ox="ssh deployer@129.67.36.198"
alias c="clear"
alias v="vim"
alias rs="bundle exec rails s"
alias rc="bundle exec rails c"
alias md="bundle exec mina deploy"

# tmux alias 
alias ta="tmux attach-session -t"

# misc aliases
alias scalatest="scala org.scalatest.run"
alias b="bundle exec"
alias transfer=transfer
alias apply-gitignore="!git ls-files -ci --exclude-standard -z | xargs -0r git rm --cached"

# fuck -- https://github.com/nvbn/thefuck
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
alias FUCK='fuck'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Vim
export EDITOR="vim"
bindkey -v 

# CD without CD
setopt AUTO_CD

# save current directory with 'mark [name]'; access saved directories with 'jump [mark name]'
# copied from: http://jeroenjanssens.com/2013/08/16/quickly-navigate-your-filesystem-from-the-command-line.html
# hacker news discussion: https://news.ycombinator.com/item?id=6229001
export MARKPATH=$HOME/.marks

function jump {
    cd -P $MARKPATH/$1 2> /dev/null || echo "No such mark: $1"
}
function mark {
    mkdir -p $MARKPATH; ln -s $(pwd) $MARKPATH/$1
}
function unmark {
    rm -i $MARKPATH/$1
}
function marks {
    ls -l $MARKPATH | sed 's/  / /g' | cut -d' ' -f9- && echo
}

# autocomplete for marks
# https://news.ycombinator.com/item?id=6229468
function _marks {
      reply=($(ls $MARKPATH))
    }
compctl -K _marks jump
compctl -K _marks unmark

# Hostname in prompt
PS1='[%* - %D] %d %%'

# pwd on right
RPROMPT='[%~]'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(sublime git copydir Forklift last-working-dir osx)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/usr/local/rvm/gems/ruby-1.9.3-p194@rails3tutorial2ndEd/bin:/usr/local/rvm/gems/ruby-1.9.3-p194@global/bin:/usr/local/rvm/rubies/ruby-1.9.3-p194/bin:/usr/local/rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:/usr/local/git/bin:/Users/wayneeseguin/.sm/bin:/Users/wayneeseguin/.sm/pkg/active/bin:/Users/wayneeseguin/.sm/pkg/active/sbin:/Applications/scala-2.10/bin

#export CLASSPATH=.:/Applications/eclipse/scalatest_2.10-2.0.jar:$CLASSPATH


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### SML
export PATH="$PATH:/usr/local/smlnj/bin"

export NVM_DIR="/Users/dvdhsu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH="/usr/local/bin:$PATH"
export PATH=/usr/local/bin:$PATH
