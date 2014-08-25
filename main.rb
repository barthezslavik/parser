zep = []
php = []
open = []
close = []
space = []
indent = 0

File.readlines('mini.php').map do |line|
  ls = line.split(" ")

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
    type = ls[0] if ls[0] =~ /public|private/
    if ls[1] =~ /function/
      args = line.split("(")[1].split(")")[0].split(",").map(&:strip)
      priv = args.select{ |e| e =~ /&/ }
      args = args.reject{ |e| e =~ /&|\n/ }
      name = ls[2].split("(")[0]
      var = args[0].gsub("$","")
      params = "const string! #{var}"
      ret = "-> char|boolean"
    end
    zep << "#{type} function #{name}(#{params}) #{ret}"
  end

  #if ls.include?("return")
  #  zep << "return #{ls[1]} #{ls[2]} #{ls[3]}"
  #end

  #if ls.include?("(")
  #  zep << "(#{ls[1]});"
  #end

  #if ls.include?("if")
  #  zep << "if#{ls[1]} #{ls[2]} #{ls[3]}"
  #end

end

zep.each_with_index do |z,i|
  puts zep[i]
end
