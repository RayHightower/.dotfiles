# .bash_profile created by RTH on 8/10/2007, originally to add the "tree" command. To reload w/o launching a new shell: source ~/.bash_profile
alias mytree="find . -type d | sed -e 1d -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|-/'"
alias vs="mvim ~/Desktop/scratchpad/scratchpad.txt" # Open scratchpad.txt in Vim

# for RubyMotion
alias rcamp="rake retina=3.5"
alias mmotion="mmotion.command" # alias added by RTH on 2/12/2013 to support RubyMotion and ctags

# for Rails
alias rdb="bundle exec rake db:migrate"
alias rr="bundle exec rake routes"

# PostgreSQL aliases suggested by @rob_dodson via his http://robdodson.me blog
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

# path added by RTH. Did I clobber the original .bash_profile?
export PATH="/usr/local/bin:/usr/local/mysql/bin:/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$HOME/bin:$PATH"
export MANPATH="/usr/local/man:$MANPATH"
export MANPATH="/usr/local/Cellar:$MANPATH"

export PAGER="most" # Colorize man pages by RTH on 9/13/2012. To use most, must $ brew install most first!!!
export EDITOR='/usr/local/bin/mvim' # Set EDITOR variable per PeepCode VIM screencast

# colorize ls in bash
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Git aliases
alias gp="git push"
alias gpos="git push origin source" # for Octopress support
alias gco="git checkout"

# For Octopress
alias berp="bundle exec rake preview"
alias berg="bundle exec rake generate"
alias berd="bundle exec rake deploy"

# Path updated 9/8/2014 by RTH to support Homebrew after re-installing Mavericks
# export PATH="/usr/local/bin:$PATH"

# Show git branch within prompt, per Michael Hartl on 7/5/2011. Use multi-line prompt per Bryan Liles at WCR2012
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
export PS1='\n\[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '

alias colortest="perl ~/Code/perl/colortest.pl -w -s" # perl colortest
alias tm="tmuxinator" # tmuxinator 'cause I keep mispelling it!
alias xcode="open *.xcodeproj" # for XCode support by RTH on 8/16/2012

# alias added for directory stuff by RTH 9/10/2007 and updated thereafter
alias cdr="cd ~/Code/Ruby"
alias cdra="cd ~/Code/Ruby/apps"
alias cdrm="cd ~/Code/Ruby/RubyMotion"
alias cdo="cd ~/Code/Objective-C"

# show & hide dotfiles in Finder added by RTH on 7/28/2012
alias showdots="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidedots="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

alias droid="say -v cello droid" #aliases added by RTH for fun & experimental stuff

# added manually by RTH to support gcc 4.2 and Ruby 1.8.7
# source: http://coderwall.com/p/dtbuqg and http://robots.thoughtbot.com/post/27985816073/the-hitchhikers-guide-to-riding-a-mountain-lion
export CC=/usr/local/bin/gcc-4.2

# GOROOT added manually by RTH on support Go on 6/22/2013
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
export GOPATH=~/Code/gocode

export GS_PROG=/usr/local/bin/gs # GS_PROG added manually by RTH to support Ghostscript on 7/21/2013

# Node.js paths entered manually by RTH to support Node.js on 8/20/2013
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"

# Path for JRuby 9000 support. Manually set by RTH on 3/3/2015
export PATH="$PATH:/opt/jruby/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
