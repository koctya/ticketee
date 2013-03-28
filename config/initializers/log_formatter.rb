
class Logger::SimpleFormatter
  def call(level, timestamp, progname, msg)
    "#{severity_color level} [#{timestamp}] -- #{String === msg ? msg: msg.inspect} (pid:#{$$})\n"
  end
  
  private
  # colors the log level severity in the console output
  def severity_color(level)
    case level
    when "DEBUG"
      "\033[0;34;40m[DEBUG]\033[0m"     # blue
    when "INFO"
      "\033[1;37;40m[INFO]\033[0m"     # bold white
    when "WARN"
      "\033[1;33;40m[WARN]\033[0m"     # bold yellow
    when "ERROR"
      "\033[1;31;40m[ERROR]\033[0m"     # bold red
    when "FATAL"
      "\033[7;31;40m[FATAL]\033[0m"     # bold black, red bg
    else
      "[#{level} # none"
    end
  end
end
