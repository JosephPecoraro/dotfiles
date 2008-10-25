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
alias ....='cd ../../'
alias mkdir='mkdir -p'
alias base64='base64 --quiet'
alias recent='ls -lAt | head'
alias mbashrc='mate ~/.bashrc'
alias sbashrc='source ~/.bashrc'
alias gsed='/usr/local/bin/sed'
alias today='date +"%A, %B %d, %Y"'
alias yest='date -v-1d +"%A %B %d, %Y"'
alias htdocs='cd /Applications/MAMP/htdocs/'
alias ttrunk='cd ~/Desktop/macwidgets/todo/trunk/'
alias ptrunk='cd ~/Desktop/macwidgets/profiles/trunk/'
alias mampmysql='/Applications/MAMP/Library/bin/mysql -u joe -p'
alias desktoptopia='open /Users/joe/Library/Application\ Support/Desktoptopia/.Backgrounds/'
alias jsdb='~/bin/jsdb_mac_1.7.2/jsdb' # JSDB Shell
alias ql='qlmanage -p "$@" >& /dev/null' # Quick Look alias
alias jsr='java org.mozilla.javascript.tools.shell.Main' # Rhino Javascript Shell

# -------------
#   School
# -------------
alias xml='cd /Users/joe/Desktop/School/_XML'
alias crypto='cd /Users/joe/Desktop/School/_Crypto'
alias alg='cd /Users/joe/Desktop/School/_Algorithms'
alias db='cd /Users/joe/Desktop/School/_Database/svnrepo'
alias mbin='cd ~/mysql-bin/bin'

# -------------
#   Shortcuts
# -------------
alias c="clear"
alias m="mate"
alias l='ls -lh'
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
alias bluehost="ssh bluehost"
alias gibson="ssh gibson"

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
# export PATH="/usr/local/pgsql/bin:$PATH" # PostgreSQL
# export MANPATH="$MANPATH:/usr/local/pgsql/man" # PostgreSQL
export PATH="/opt/subversion/bin:$PATH" # Subversion 1.5.1
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin" # My Built Mysql
export PATH="$HOME/bin/:$PATH"
export CLASSPATH="$CLASSPATH:/Users/joe/.classpath:/Users/joe/.classpath/js.jar"
export HISTSIZE=10000
export HISTFILESIZE=10000
export PAGER=less
export CLICOLOR=1
export EDITOR=vim
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

# Strip Extra Whitespace from all files in a directory and subdirectories
# UNSAFE FOR IMAGES... MAKE A SHELL SCRIPT
#stripws() {
#	dirsize .
#	find . -exec rr --line --modify '\s+$' '' {} \;;
#	dirsize .
#}

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
