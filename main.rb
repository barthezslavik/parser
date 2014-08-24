class Parser
  attr_accessor :type, :php_lines, :zep_lines

  def initialize
    self.zep_lines = []
  end
end

p = Parser.new

File.readlines('HStoreParser.php').map do |line|
  p.zep_lines << "" if line == "<?php\n" 
end

abort p.zep_lines.inspect
