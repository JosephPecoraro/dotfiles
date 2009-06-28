# ---------------
#   Environment
# ---------------

# PATH: /opt : ~/bin : (normal) : /usr/local : (other)
export PATH="/opt/subversion/bin:$PATH"                   # Subversion 1.5.1
export PATH="$HOME/bin:$HOME/bin/crontasks:$PATH"         # ~/bin and cron scripts
export PATH="$PATH:/usr/local/mysql/bin"                  # Mysql 5.1.34
export PATH="$PATH:$HOME/WebKit/WebKitTools/Scripts"      # Webkit Tools

# Java's Path
export CLASSPATH="$CLASSPATH:/Users/joe/.classpath:/Users/joe/.classpath/js.jar"       # Rhino 1.7
export CLASSPATH="$CLASSPATH:`ruby -e \"print Dir['/Users/joe/.jars/*'].join(':')\"`"  # all jars in ~/.jars

# For Mercurial
export PYTHONPATH="/usr/local/lib/python2.5/site-packages/"

# For WebKit Scripts
export REAL_NAME="Joseph Pecoraro"
export EMAIL_ADDRESS="joepeck02@gmail.com"
export CHANGE_LOG_EDIT_APPLICATION="TextMate"

# General
export HISTSIZE=10000
export HISTFILESIZE=10000
export PAGER=less
export CLICOLOR=1
export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
shopt -s histappend

# Execute .bashrc if it's there
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
