# load libraries
%w{ rubygems yaml what_methods wirble hpricot }.each { |lib| require lib }

# start wirble
Wirble.init
# Wirble.colorize

# Customize the prompt a little
# Taken from => http://dotfiles.org/~sd/.irbrc
unless self.class.const_defined? "IRB_RC_HAS_LOADED"
  HISTFILE = "~/.irb.hist"
  MAXHISTSIZE = 100

  begin # ANSI codes
    ANSI_BLACK    = "\033[0;30m"
    ANSI_GRAY     = "\033[1;30m"
    ANSI_LGRAY    = "\033[0;37m"
    ANSI_WHITE    =  "\033[1;37m"
    ANSI_RED      ="\033[0;31m"
    ANSI_LRED     = "\033[1;31m"
    ANSI_GREEN    = "\033[0;32m"
    ANSI_LGREEN   = "\033[1;32m"
    ANSI_BROWN    = "\033[0;33m"
    ANSI_YELLOW   = "\033[1;33m"
    ANSI_BLUE     = "\033[0;34m"
    ANSI_LBLUE    = "\033[1;34m"
    ANSI_PURPLE   = "\033[0;35m"
    ANSI_LPURPLE  = "\033[1;35m"
    ANSI_CYAN     = "\033[0;36m"
    ANSI_LCYAN    = "\033[1;36m"
    
    ANSI_BACKBLACK  = "\033[40m"
    ANSI_BACKRED    = "\033[41m"
    ANSI_BACKGREEN  = "\033[42m"
    ANSI_BACKYELLOW = "\033[43m"
    ANSI_BACKBLUE   = "\033[44m"
    ANSI_BACKPURPLE = "\033[45m"
    ANSI_BACKCYAN   = "\033[46m"
    ANSI_BACKGRAY   = "\033[47m"

    ANSI_RESET      = "\033[0m"
    ANSI_BOLD       = "\033[1m"
    ANSI_UNDERSCORE = "\033[4m"
    ANSI_BLINK      = "\033[5m"
    ANSI_REVERSE    = "\033[7m"
    ANSI_CONCEALED  = "\033[8m"

    XTERM_SET_TITLE   = "\033]2;"
    XTERM_END         = "\007"
    ITERM_SET_TAB     = "\033]1;"
    ITERM_END         = "\007"
    SCREEN_SET_STATUS = "\033]0;"
    SCREEN_END        = "\007"
  end
  
  begin # Custom Prompt
    if ENV['RAILS_ENV']
      name = "rails #{ENV['RAILS_ENV']}"
      colors = ANSI_BACKBLUE + ANSI_YELLOW
    else
      name = "ruby"
      colors = ANSI_BACKPURPLE + ANSI_YELLOW
    end

    if IRB and IRB.conf[:PROMPT]
      IRB.conf[:PROMPT][:SD] = {
        :PROMPT_I => ">> ", # normal prompt
        :PROMPT_S => "%l> ",  # string continuation
        :PROMPT_C => " > ",   # code continuation
        :PROMPT_N => " > ",   # code continuation too?
        :RETURN   => "#{ANSI_BOLD}# => %s  #{ANSI_RESET}\n",  # return value
      }
      IRB.conf[:PROMPT_MODE] = :SD
    end
  end
  
  IRB_RC_HAS_LOADED = true
end

# A cool way to index in a hash
# h = { :alpha => 'bet', :beta => 'blocker' }
# h/:beta #=> 'blocker'
class Hash
  def /(key)
    self[key]
  end
end

# A real array def, not a set diff
# a1 = [1,1,2]
# a2 = [1,2]
# a1 - a2     #=> []
# a1.diff(a2) #=> [1]
class Array
	def diff(other)
		list = self.dup
		other.each { |elem| list.delete_at( list.index(elem) ) }
		list
	end
end

# Where quasi global methods belong (Thanks to aperios for teaching me!)
module Kernel
  
  # Awesome benchmarking function
  # Source: http://ozmm.org/posts/time_in_irb.html
  def time(times=1)
    require "benchmark"
    ret = nil
    Benchmark.bm { |x| x.report { times.times { ret = yield } } }
    ret
  end
  alias :bench :time

  # Copy the last IRB result into the clipboard
  # Thanks to aperios (apeiros@gmx.ne) in #ruby-lang  
  def pbcopy
    IO.popen('pbcopy', 'w') { |io| io.write(IRB.CurrentContext.last_value.to_s) }
  end
  
  # Open in TextMate
  def mate *args
    flattened_args = args.map {|arg| "\"#{arg.to_s}\""}.join ' '
    `mate #{flattened_args}`
    nil
  end
 
  # Clear (My alias c=clear inside IRB)
  def c
    system('clear')
  end
  
end

# Simple regular expression helper
# show_regexp - stolen from the pickaxe
def show_regexp(a, re)
  if a =~ re
    "#{$`}<<#{$&}>>#{$'}"
  else
    "no match"
  end
end

# Convenience method on Regexp so you can do
# /an/.show_match("banana") # => "b<<an>>ana" 
class Regexp
  def show_match(a)
    show_regexp(a, self)
  end
end


# Why's aorta method to edit an object in YAML, awesome!
# Source: http://rubyforge.org/snippet/detail.php?type=snippet&id=22
def aorta( obj )
  tempfile = File.join('/tmp',"yobj_#{ Time.now.to_i }")
  File.open( tempfile, 'w' ) { |f| f << obj.to_yaml }
  system( "#{ ENV['EDITOR'] || 'vi' } #{ tempfile }" )
  return obj unless File.exists?( tempfile )
  content = YAML::load( File.open( tempfile ) )
  File.delete( tempfile )
  content
end
def aorta!(obj)
  obj = aorta(obj)
end


# Load all my non-test libraries in '~/.util/irb'
util_dir = File.expand_path('~') + '/.util/irb/*'
Dir[util_dir].each do |f|
  require f unless File.basename(f) =~ /\Atest/
end
