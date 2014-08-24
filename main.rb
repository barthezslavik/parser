class Parser
  attr_accessor :zep

  def initialize
    self.zep = []
  end
end

p = Parser.new

File.readlines('HStoreParser.php').map do |line|
  ls = line.split(" ") 
  p.zep << "}" if line.split("\n").include?("}")
  p.zep << "{" if line.split("\n").include?("{")
  p.zep << "" if line == "<?php\n"

  if ls.include?("class")
    p.zep << "class #{ls[1]}"
  end

  if ls.include?("function")
    p.zep << "class #{ls[1]}"
  end

  #p.line_number += 1
end

abort p.zep.inspect
