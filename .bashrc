# -----------
#   General
# -----------
alias ..='cd ..'
alias get='curl'
alias ll='ls -lh'
alias la='ls -la'
alias du='du -hc'
alias more='less'
alias psa='ps -Ax'
alias cd..='cd ..'
alias cl='clear;ls'
alias rrrm='rm -rf'
alias err='echo $?'
alias ldir='ls -d */'
alias ....='cd ../../'
alias mkdir='mkdir -p'
alias base64='base64 --quiet'
alias recent='ls -lAt | head'
alias gsed='/usr/local/bin/sed'
alias today='date +"%A, %B %d, %Y"'
alias yest='date -v-1d +"%A %B %d, %Y"'
alias now='ruby -e "puts Time.now.to_i"'
alias junit='java junit.textui.TestRunner'
alias htdocs='cd /Applications/MAMP/htdocs/'
alias ql='qlmanage -p "$@" >& /dev/null' # Quick Look alias
alias mampmysql='/Applications/MAMP/Library/bin/mysql -u joe -p'
alias matedir='cd ~/Library/Application\ Support/TextMate/Bundles'
alias webserver="echo 'http://bogojoker.is-a-geek.com:8000/'; python -m SimpleHTTPServer"
alias desktoptopia='open /Users/joe/Library/Application\ Support/Desktoptopia/.Backgrounds/'


# -------------
#   School
# -------------
alias dist="cd /Users/joe/Desktop/School/_Distributed_Design_Patterns/"


# --------------------
#   Global Variables
# --------------------
bin="$HOME/bin"
code="$HOME/code"
rit="/Volumes/RIT/"
cron="$bin/crontasks/"
htdocs="/Applications/MAMP/htdocs"
school="/Users/joe/Desktop/School/"
bogo="/Volumes/BogoJoker/public_html"
b="$bogo"
c="$code"
h="$htdocs"


# -------------
#   Shortcuts
# -------------
alias ?='man'
alias i='irb'
alias m='mate'
alias d='dict'
alias e='echo'
alias f='find'
alias g='grep'
alias r='rake'
alias c='clear'
alias p='psgrep'
alias l='ls -lhp'
alias h='history'
alias t='template'
alias x='expanurl'
alias w='which -a'
alias s='easy_share'
alias o='better_open'
alias n='ruby -e "ARGV.each{|x|puts x}"'


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
alias gibson="ssh gibson"
alias bogo="ssh bogo"


# --------
#   Bash
# --------
alias mbashrc='mate ~/.bashrc'
alias sbashrc='source ~/.bashrc'


# -------
#   Git
# -------
alias ga='git add'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gh='github browse'
alias gl='git log --pretty=format:"%Cgreen%h%Creset %an %s" --stat;echo';


# -------
#   SVN
# -------
rmsvn() { rm -rf `find . -type d -name .svn`; }


# --------
#   Ruby
# --------
alias irb='irb -r irb/completion -rubygems'
alias irb19='irb19 -r irb/completion -rubygems'
alias rspec='spec --format specdoc'
alias gemedit='gemedit --editor=mate'


# ---------
#   Rails
# ---------
alias ss='script/server'
alias sc='script/console'
alias sg='script/generate'


# --------------
#   Javascript
# --------------
alias jsdb='~/bin/jsdb_mac_1.7.2/jsdb' # JSDB Shell
alias jsr='java org.mozilla.javascript.tools.shell.Main' # Rhino Javascript Shell
alias v8='/usr/local/src/v8/shell' # V8 Javascript Shell


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

# Git the fileurl of the current directory or the given file
fileurl() {
	if [ "$1" ]
		then echo -n "file://$(pwd)/$1"
		else echo -n "file://$(pwd)"
	fi
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
