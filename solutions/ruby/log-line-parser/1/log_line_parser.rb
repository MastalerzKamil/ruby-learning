class LogLineParser
  def initialize(line)
    @line = line
    @message = nil
    @log_level = nil

    if line =~ /^\[(.*?)\]:\s*(.*)$/m
      @log_level = $1.downcase
      @message = $2.strip
    else
      @log_level = ""
      @message = line.strip
    end
  end

  def message
    log_split = @line.split(':')
    debug "message is #{log_split[1]}."
    @message = log_split[1].strip
  end

  def log_level
    log_split = @line.split(':')
    debug "message is #{log_split[1]}."
    log_level_length = log_split[1].length
    debug "length is #{log_level_length}."
    @log_level = log_split[0].delete_prefix('[').delete_suffix(']').downcase
  end

  def reformat
    return "#{@message} (#{@log_level})"
  end
end
