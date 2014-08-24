class Parser
  attr_accessor :zep

  def initialize
    self.zep = []
  end
end

p = Parser.new

File.readlines('HStoreParser.php').map do |line|
  ls = line.split(" ")

  p.zep << "}" if ls.include?("}")
  p.zep << "{" if ls.include?("{")

  if ls.include?("class")
    p.zep << "class #{ls[1]}"
  end

  if ls.include?("function")
    name = ls[2].split("(")[0]
    p.zep << "#{ls[0]} #{ls[1]} #{name}()"
  end

  if ls.include?("return")
    p.zep << "return #{ls[1]} #{ls[2]} #{ls[3]}"
  end

  if ls.include?("(")
    p.zep << "(#{ls[1]});"
  end

  if ls.include?("if")
    p.zep << "if#{ls[1]} #{ls[2]} #{ls[3]}"
  end
end

p.zep.each do |l|
  puts l
end
