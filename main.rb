class Parser
  attr_accessor :line_number, :php_lines, :zep_lines

  def initialize
    self.zep_lines = []
    self.line_number = 0
  end
end

p = Parser.new

File.readlines('HStoreParser.php').map do |line|
  
  p.zep_lines << "}" if line.split("\n").include?("}")
  p.zep_lines << "{" if line.split("\n").include?("{")
  p.zep_lines << "" if line == "<?php\n"
  if line.split(" ").include?("class")
    p.zep_lines << "class"
  end

  if line == "private function charAfterSpaces($str, &$p)\n"
    p.zep_lines << "private function charAfterSpaces(const string! str) -> char|boolean"
  end

  #p.line_number += 1
end

abort p.zep_lines.inspect
