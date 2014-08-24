class Parser
  attr_accessor :zep

  def initialize
    self.zep = []
  end
end

p = Parser.new

File.readlines('HStoreParser.php').map do |line|
  ls = line.split(" ")
  lsn = line.split("\n")
  p.zep << "}" if lsn.include?("}")
  p.zep << "{" if lsn.include?("{")

  if ls.include?("class")
    p.zep << "class #{ls[1]}"
  end

  if ls.include?("function")
    p.zep << "class #{ls[1]}"
  end

  #p.line_number += 1
end

abort p.zep.inspect
