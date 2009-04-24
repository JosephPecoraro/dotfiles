# -----------
#   General
# -----------
alias ..='cd ..'
alias ll='ls -lh'
alias la='ls -la'
alias du='du -hc'
alias psa='ps -Ax'
alias cd..='cd ..'
alias cl='clear;ls'
alias ex='expanurl'
alias more='less'
alias rrrm='rm -f' # "Really Really Remove" - James Heliotis
alias ldir='ls -d */'
alias ....='cd ../../'
alias mkdir='mkdir -p'
alias base64='base64 --quiet'
alias recent='ls -lAt | head'
alias mbashrc='mate ~/.bashrc'
alias sbashrc='source ~/.bashrc'
alias gsed='/usr/local/bin/sed'
alias v8='/usr/local/src/v8/shell' # V8 Javascript Shell
alias today='date +"%A, %B %d, %Y"'
alias gemedit='gemedit --editor=mate'
alias fileurl='echo -n "file://$(pwd)"'
alias yest='date -v-1d +"%A %B %d, %Y"'
alias now='ruby -e "puts Time.now.to_i"'
alias junit='java junit.textui.TestRunner'
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
alias rubyish="java Rubyish.RubyishREPL"
alias compiler="cd /Users/joe/Desktop/School/_Compiler"
alias para="cd /Users/joe/Desktop/School/_Parallel"
alias complex="cd /Users/joe/Desktop/School/_Complexity"

# --------------------
#   Global Variables
# --------------------
bin="$HOME/bin"
code="$HOME/code"
rit="/Volumes/RIT/"
bogo="/Volumes/BogoJoker/public_html"
htdocs="/Applications/MAMP/htdocs"
school="/Users/joe/Desktop/School/"
alias bogo="cd $bogo"

# -------------
#   Shortcuts
# -------------
alias ?='man'
alias i='irb'
alias m='mate'
alias d='dict'
alias e='echo'
alias g='grep'
alias r='ruby'
alias c='clear'
alias p='psgrep'
alias l='ls -lhp'
alias h='history'
alias x='expanurl'
alias s='easy_share'
alias o='better_open'
alias n='ruby -e "ARGV.each{|x|puts x}"'
alias w="echo 'http://bogojoker.is-a-geek.com:8000/'; python -m SimpleHTTPServer"

# -------------
#   Functions
# -------------

# Rerun the last cmd and put its output into the clipboard
copy() {
	eval `history | line -s -2 | sed -r "s/[0-9]+//"` | pbcopy;
}

# Just take the last command and put that command into the clipboard
copycmd() {
	echo `history | line -s -2 | sed -r "s/[0-9]+//"` | pbcopy;
}

# Shortcut for `open` but no arguments opens the current directory
better_open() {
  if [ "$1" ]
	then `open "$1"`
	else `open .`
	fi
}

# Append to an Environmental Variable
addto() {
	old=`env | grep "^$1=" | sed "s/^$1=//"`
	export $1=$old:$2
}

# Lookup in the Apple Dictionary
# Source: http://hayne.net/MacDev/Bash/aliases.bash
dict() {
	open dict:///"$@";
}

# Convenience for printing awk fields
# NOTE: when making a public script use `cut`
fawk() {
	CMD="{print \$$1"
	shift
	while [ $# -gt 0 ]; do
		CMD=$CMD",\$$1"
		shift
	done
	CMD=$CMD'}'
	awk "$CMD"
}

# Handy Extract Program
# Source: http://www.shell-fu.org/lister.php?id=375
# Modifications: added jar, removed 7z and rar
extract() {
	if [ -f $1 ]; then
		case $1 in
			*.tar.bz2)   tar xvjf $1   ;;
			*.tar.gz)    tar xvzf $1   ;;
			*.bz2)       bunzip2 $1    ;;
			*.gz)        gunzip $1     ;;
			*.jar)       jar xf $1     ;;
			*.tar)       tar xvf $1    ;;
			*.tbz2)      tar xvjf $1   ;;
			*.tgz)       tar xvzf $1   ;;
			*.zip)       unzip $1      ;;
			*.Z)         uncompress $1 ;;
			*)           echo "'$1' cannot be extracted via >extract<" ;;
		esac
	else
		echo "'$1' is not a valid file"
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
alias gc='git commit'
alias gl='git log --pretty=format:"%Cgreen%h%Creset %an %s" --stat;echo';

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

# Reminder how to do neat diffs
# diff <(echo a) <(echo b)
