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
alias ex='expanurl'
alias more='less'
alias ldir='ls -d */'
alias ....='cd ../../'
alias mkdir='mkdir -p'
alias base64='base64 --quiet'
alias recent='ls -lAt | head'
alias mbashrc='mate ~/.bashrc'
alias sbashrc='source ~/.bashrc'
alias gsed='/usr/local/bin/sed'
alias gemedit='gemedit --editor=mate'
alias today='date +"%A, %B %d, %Y"'
alias yest='date -v-1d +"%A %B %d, %Y"'
alias htdocs='cd /Applications/MAMP/htdocs/'
alias mampmysql='/Applications/MAMP/Library/bin/mysql -u joe -p'
alias matedir='cd ~/Library/Application\ Support/TextMate/Bundles'
alias desktoptopia='open /Users/joe/Library/Application\ Support/Desktoptopia/.Backgrounds/'
alias jsdb='~/bin/jsdb_mac_1.7.2/jsdb' # JSDB Shell
alias ql='qlmanage -p "$@" >& /dev/null' # Quick Look alias
alias jsr='java org.mozilla.javascript.tools.shell.Main' # Rhino Javascript Shell

# -------------
#   School
# -------------
alias compiler="cd /Users/joe/Desktop/School/_Compiler"
alias para="cd /Users/joe/Desktop/School/_Parallel"
alias complex="cd /Users/joe/Desktop/School/_Complexity"

# -------------
#   BogoJoker
# -------------
BOGO="/Volumes/BogoJoker/public_html"
bogo="$BOGO"
alias bogo="cd $BOGO"

# -------------
#   Shortcuts
# -------------
alias ?='man'
alias i="irb"
alias m="mate"
alias e="echo"
alias c="clear"
alias l='ls -lhp'
alias h="history"
alias x="expanurl"

# Shortcut for `open`
o() {
  if [ "$1" ]
	then `open "$1"`
	else `open .`
	fi
}

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

# Now I just use the github gem!
# alias github="open \`git config -l | grep 'remote.origin.url' | sed -En 's/remote.origin.url=git(@|:\/\/)github.com(:|\/)(.+)\/(.+).git/https:\/\/github.com\/\3\/\4/p'\`"

# -------
#   SVN
# -------
rmsvn(){ find . -name ".svn" -type d -exec rm -rf {} \;; } # Note: "&> /dev/null" will suppress output

# --------
#   Ruby
# --------
alias irb='irb -r irb/completion -rubygems'
alias irb19='irb19 -r irb/completion -rubygems'

# ---------------
#   Environment
# ---------------
export PATH="/opt/subversion/bin:$PATH" # Subversion 1.5.1
export PATH="$PATH:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin"
export PATH="$HOME/bin/:$PATH"
export CLASSPATH="$CLASSPATH:/Users/joe/.classpath:/Users/joe/.classpath/js.jar"
export CLASSPATH="$CLASSPATH:/Users/joe/workspace/Rubyish/bin" # School
export HISTSIZE=10000
export HISTFILESIZE=10000
export PAGER=less
export CLICOLOR=1
export EDITOR=vim
export LC_CTYPE=en_US.UTF-8
shopt -s histappend

# ---------
#   Prompt
# ---------

# The terminal display - "user[path](gitbranch)$ "
#   - gitbranch only shows up in a git repo
#   - gitbranch will have a * if there is a pending change
#   - gitbranch Source => http://gist.github.com/31631
parse_git_dirty(){ [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"; }
parse_git_branch(){ git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"; }
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

# Convert a Man Page to a PDF, really slick
# SOURCE => http://dotfiles.org/~miragj/.bashrc
pman() { man -t "$1" | open -f -a /Applications/Preview.app/; }

# Run .profile (MacPorts)
source ~/.profile

# PDF Merge Command, to be created later
# /usr/local/bin/gs -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=talking_points.pdf dbsi-notes-1.pdf dbsi-notes-2.pdf dbsi-notes-3.pdf dbsi-notes-4.pdf 
