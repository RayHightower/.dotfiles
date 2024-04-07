#Timestamp each time .zhsrc is run
echo "$(date) -- .zshrc executed" >> $HOME/.zshrc.log

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

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
alias cdrh="cd ~/Code/Ruby/RayHightower.com"
alias cdo="cd ~/Code/Objective-C"
alias cdc="cd ~/Code/Clojure"

# Show git branch in prompt, per https://gist.github.com/reinvanoyen/05bcfe95ca9cb5041a4eafd29309ff29
# with NEWLINE and color modifications by RTH, 2/17/2022
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working tree clean" ]] && echo "*"
}
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='${NEWLINE}${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)$(parse_git_dirty)${COLOR_DEF} $ '

# REMOVED by RTH to address formatting problems in iterm. 4/7/2024.
# Color codes given below were for bash, not zsh. Switched to zsh color codes per this gist:
# https://gist.github.com/reinvanoyen/05bcfe95ca9cb5041a4eafd29309ff29?permalink_comment_id=4409650#gistcomment-4409650
#
# function parse_git_branch() {
#     git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
# }

# COLOR_DEF=$'\e[0m'
# COLOR_USR=$'\e[38;5;243m'
# COLOR_DIR=$'\e[38;5;48m'
# COLOR_GIT=$'\e[38;5;39m'
# NEWLINE=$'\n'
# setopt PROMPT_SUBST
# export PROMPT='${NEWLINE}${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)$(parse_git_dirty)${COLOR_DEF} $ '