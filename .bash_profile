# ---------------
#   Environment
# ---------------

# PATH: /opt : ~/bin : (normal) : /usr/local : (other)
export PATH="/opt/subversion/bin:$PATH"                   # Subversion 1.5.1
export PATH="$HOME/bin:$HOME/bin/crontasks:$PATH"         # ~/bin and cron scripts
export PATH="$PATH:/usr/local/mysql/bin"                  # Mysql 5.1.34
export PATH="$PATH:$HOME/WebKit/WebKitTools/Scripts"      # Webkit Tools
export PATH="$PATH:$HOME/code/narwhal/bin"                # Narwhal Common JS

# Java's Path
export CLASSPATH="$CLASSPATH:`ruby -e \"print Dir['/Users/joe/.jars/*'].join(':')\"`"  # all jars in ~/.jars

# For Mercurial
export PYTHONPATH="/usr/local/lib/python2.5/site-packages/"

# For WebKit Scripts
export REAL_NAME="Joseph Pecoraro"
export EMAIL_ADDRESS="joepeck@webkit.org"
export CHANGE_LOG_EDIT_APPLICATION="TextMate"

# For Go
export GOROOT="$HOME/go"
export GOOS="darwin"
export GOARCH="amd64"
export GOBIN="$HOME/bin"

# General
export HISTSIZE=10000
export HISTFILESIZE=10000
export PAGER=less
export CLICOLOR=1
export EDITOR="mate --wait"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=C
shopt -s histappend
shopt -s extglob

# Execute .bashrc if it's there
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
