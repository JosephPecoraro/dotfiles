# -----------
#   General
# -----------
alias ..='cd ..'
alias ll='ls -lh'
alias la='ls -la'
alias ps='ps -ax'
alias du='du -hc'
alias cd..='cd ..'
alias cl='clear;ls'
alias more='less'
alias mkdir='mkdir -p'
alias today='date +"%A, %B %d, %Y"'
alias yest='date -v-1d +"%A %B %d, %Y"'
alias base64='base64 --quiet'
alias recent='ls -lAt | head'
alias ebashrc='mate ~/.bashrc'
alias mbashrc='mate ~/.bashrc'
alias sbashrc='source ~/.bashrc'
alias htdocs='cd /Applications/MAMP/htdocs/'
alias mampmysql='/Applications/MAMP/Library/bin/mysql -u joe -p'
alias desktoptopia='open /Users/joe/Library/Application\ Support/Desktoptopia/.Backgrounds/'
alias ql='qlmanage -p "$@" >& /dev/null' # Quick Look alias
alias jsr='java org.mozilla.javascript.tools.shell.Main' # Rhino Javascript Shell

# -------------
#   Shortcuts
# -------------
alias c="clear"
alias m="mate"
alias h="history"

# ----------------
#   Autocomplete
# ----------------
source ~/.bash_complete

# --------
#   SSHs
# --------
# See: ~/.ssh/config
# Old: ssh host.whatever.edu -l username
alias rit="ssh rit"

# -------
#   Git
# -------
alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias github="open \`git config -l | grep 'remote.origin.url' | sed -En 's/remote.origin.url=git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'\`"

# -------
#   SVN
# -------
rmsvn(){ find . -name ".svn" -type d -exec rm -rf {} \;; } # Note: "&> /dev/null" will suppress output

# --------
#   Ruby
# --------
alias irb='irb -r irb/completion -rubygems'

# ---------------
#   Environment
# ---------------
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin"
export PATH="$HOME/bin/:$PATH"
export CLASSPATH="$CLASSPATH:/Users/joe/.classpath:/Users/joe/.classpath/js.jar"
export HISTSIZE=10000
export HISTFILESIZE=10000
export PAGER=less
export CLICOLOR=1
shopt -s histappend

# ---------
#   Prompt
# ---------

# The terminal display - "user[path](gitbranch)$ " where gitbranch only shows up in a git repo
parse_git_branch(){ git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'; }
export PS1="\u[\w]\$(parse_git_branch)$ "

# ---------
#   Other
# ---------

# Cool History Summerizer
historyawk(){ history|awk '{a[$2]++}END{for(i in a){printf"%5d\t%s\n",a[i],i}}'|sort -nr|head; }

# cd directly to a dir and list contents
cdl() {
  if [ "$1" ]
  then builtin cd "$1" && ll
  else builtin cd && ll
  fi
}

# mkdir and cd directly to it
mkdirc() {
	if [ "$1" ]
		then mkdir -p "$1" && cd "$1"
	fi
}

# Open a new terminal tab in the same directory as the current
# SOURCE => http://pastie.caboo.se/188640
#    AND => http://justinfrench.com/index.php?id=231
nth() {
  osascript -e "
  Tell application \"Terminal\"
    activate
    tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down
    do script with command \"cd '$(pwd)'; clear\" in selected tab of the front window
  end tell"
}

# Run .profile (MacPorts)
source ~/.profile
