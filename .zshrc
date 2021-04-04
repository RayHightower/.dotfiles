# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'
 
# Set up the prompt (with git branch name)
# setopt PROMPT_SUBST
# NEWLINE=$'\n'
# PROMPT='${NEWLINE}%n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} $ '
# PROMPT='${NEWLINE}%n in ${PWD/#$HOME/~} [${vcs_info_msg_0_}] $ '

# Show git branch within prompt, per Michael Hartl on 7/5/2011. Use multi-line prompt per Bryan Liles at WCR2012
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
# export PS1='\n\[\033[1;33m\]\w\[\033[0m\]$(parse_git_branch)$ '
NEWLINE=$'\n'
# export PS1='${NEWLINE}%n:${PWD/#$HOME/~} $(parse_git_branch)$ '
# export PROMPT='${NEWLINE}%n:${PWD/#$HOME/~} $(parse_git_branch)$ '
export PROMPT='%n %~ $ '

# colorize ls in zsh (taken from RTH's bash script)
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

### ~/.zshrc~ (added by RTH on 3/7/2021 to support Homebrew's Ruby)
if [ -d "/usr/local/opt/ruby/bin" ]; then
  export PATH=/usr/local/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

# Added by RTH on 3/12/2021 to allow use of Homebrew's libffi instead of macOS ffi. Attempt to make rvm install ruby work.
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"

# For Jekyll
alias js1="bundle exec jekyll serve -w --port 4001" # This alias and below are for Jekyll 3.
alias js2="bundle exec jekyll serve -w --port 4002"
alias js3="bundle exec jekyll serve -w --port 4003"
alias js4="bundle exec jekyll serve -w --port 4004"

alias colortest="perl ~/Code/perl/colortest.pl -w -s" # perl colortest
alias tm="tmuxinator" # tmuxinator 'cause I keep mispelling it!
alias xcode="open *.xcodeproj" # for XCode support by RTH on 8/16/2012

# alias added for directory stuff by RTH 9/10/2007 and updated thereafter
alias cdr="cd ~/Code/Ruby"
alias cdra="cd ~/Code/Ruby/"
alias cdo="cd ~/Code/Objective-C"
alias cdc="cd ~/Code/Clojure"