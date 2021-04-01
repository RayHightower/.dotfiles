# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on branch %b'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='\n %n in ${PWD/#$HOME/~} ${vcs_info_msg_0_} $ '

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