# -*- coding: utf-8 -*-

def output_line
  f = lambda do |s|
    if !(s =~ /.*notit.*/) then
      puts ""
    end
      
    if s =~ /^[　 ]*$/ then
      puts "\\medskip"
    else
      puts s 
    end
  end
  return f
end

def output_line_s
  bBlank = 0
  f = lambda do |s|
    puts ""
    if s =~ /^[　 ]*$/ then
      bBlank = bBlank + 1
    else
      if bBlank > 1 then
        puts "\\medskip "
      end
      bBlank = 0
      puts s 
    end
  end
  return f
end


if ARGV.index("-s") then
  out = output_line_s
else
  out = output_line
end

ARGV.delete("-s")

if ARGV[0] = ""
  stream = STDIN
else
  stream = open(ARGV[0])
end

stream.each do |s|
  s.strip!
  rubydo = Proc.new do |ssub|
    kan = $1
    kana = $2
    if kana =~ /^《(.*)》$/ then
      tag = kan + "<@@" + $1 + "@@>"
    elsif kana =~ /、+/ then
      tag = "\\bou" + "{" + kan + "}" 
    else
      tag = "\\ruby{" + kan + "}{" + kana + "}"
    end
    tag
  end
  s.gsub! /《《/,"<@@"
  s.gsub! /》》/,"@@>"
  s.gsub! /(?:\||｜)(.*?)(?:《|≪)(.*?)(?:》|≫)/, &rubydo
  s.gsub! /(.)(?:《|≪)(.*?)(?:》|≫)/, &rubydo
  s.gsub! /<@@/,"《"
  s.gsub! /@@>/,"》"
  s.gsub! /─/, "―"
  s.gsub! /---/, "―"
  s.gsub! /――/, "\\dash "
  s.gsub! /……/, "\\tendash "
  s.gsub! /ゝゝ/, "\\ajKunoji "
  s.gsub! /ゝゞ/, "\\ajKunoji " #二文字目濁点は再現しない
  s.gsub! /ゞゝ/, "\\ajDKunoji "
  #s.gsub! /["“”](.[^"“”]*)["“”]/, "\\sdq \\1\\edq "
  
  #.gsub! /([^\\\.{0-9a-zA-Z])([0-9a-zA-Z]{1,3})([^0-9a-zA-Z])/,"\\1\\rensuji{\\2}\\3"

  s.sub!(/^　([^　 ])/, "\\widowpenalty=0\\clubpenalty=0 \\1")
  s.sub!(/^「/, "\\「")
  s.sub!(/^『/, "\\tnoind{『}")
  s.sub!(/^〈/, "\\tnoind{〈}")
  s.gsub!(/。$/, "\\danmatuku")
  s.gsub!(/。/, "\\。")
  s.gsub!(/、$/, "\\danmatutou")
  s.gsub!(/、/, "\\、")
  s.gsub!(/？[ 　]/, "？")
  s.gsub!(/！[ 　]/, "！")
  s.gsub!(/：/, "\\hspace{2pt}\\raisebox{1pt}{:}")
  s.gsub!(/[!！][?？]/, "\\ajLig{!?}")


  out.call(s)
end


