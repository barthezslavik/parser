zep = []
open = []
close = []
space = []
indent = 0

File.readlines('HStoreParser.php').map do |line|
  ls = line.split(" ")

=begin
  zep << "}" if ls.include?("}")
  zep << "{" if ls.include?("{")

  if ls.include?("namespace")
    name = ls[1].split("\\").last
    zep << "namespace #{name}"
  end

  if ls.include?("class")
    zep << "class #{ls[1]}"
  end

  if ls.include?("function")
    name = ls[2].split("(")[0]
    zep << "#{ls[0]} #{ls[1]} #{name}()"
  end

  if ls.include?("return")
    zep << "return #{ls[1]} #{ls[2]} #{ls[3]}"
  end

  if ls.include?("(")
    zep << "(#{ls[1]});"
  end

  if ls.include?("if")
    zep << "if#{ls[1]} #{ls[2]} #{ls[3]}"
  end
=end
  zep << "#{ls[0]} #{ls[1]} #{ls[2]} #{ls[3]} #{ls[4]} #{ls[5]}"
end

zep.each_with_index do |z,i|
  space << 0
  open << i if z == "{"
  close << i if z == "}"
end

space.each_with_index do |s,i|
  indent += 1 if open.include?(i)
  indent -= 1 if close.include?(i)
  space[i] = indent
end

puts open.inspect
puts close.inspect
puts space.inspect

zep.each_with_index do |z,i|
  s = ""
  space[i].times { s += " " }
  puts "#{s} #{zep[i]}"
end
