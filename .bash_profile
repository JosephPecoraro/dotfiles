# ---------------
#   Environment
# ---------------

export PATH="/opt/subversion/bin:/usr/local/bin:$PATH" # Subversion 1.5.1
export PATH="$PATH:/usr/local/sbin:/usr/local/mysql/bin"
export PATH="$HOME/bin:$HOME/bin/crontasks:$PATH"
export PATH="$PATH:$HOME/WebKit/WebKitTools/Scripts" # Webkit Tools
export CLASSPATH="$CLASSPATH:/Users/joe/.classpath:/Users/joe/.classpath/js.jar"
export CLASSPATH="$CLASSPATH:/Users/joe/workspace/Rubyish/bin" # School
export CLASSPATH="$CLASSPATH:/Users/joe/workspace/Monotonicity/bin" # School
export CLASSPATH="$CLASSPATH:/Users/joe/workspace/MUD/bin" # School
# export CLASSPATH="$CLASSPATH:/Users/joe/Desktop/School/_Distributed/Games/Client/build/classes" # School
export CLASSPATH="$CLASSPATH:`ruby -e \"print Dir['/Users/joe/.jars/*'].join(':')\"`" # All the jars in my ~/.jars dir
export HISTSIZE=10000
export HISTFILESIZE=10000
export PAGER=less
export CLICOLOR=1
export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
shopt -s histappend

# source .bashrc if it's there
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
