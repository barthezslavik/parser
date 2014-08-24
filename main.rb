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
    name = ls[2].split("(")[0]
    p.zep << "#{ls[0]} #{ls[1]} #{name}"
  end
end

p.zep.each do |l|
  puts l
end
