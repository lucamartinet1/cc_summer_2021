require './verification'
allrubies = [] 
File.open("rubies.txt", "w+")
    puts(allrubies)
  end

> "ruby" 

def getrubies:
    line_num=0
text=File.open('rubies.txt').read
text.gsub!(/\r\n?/, "\n")
text.each_line do |line|
    print "#{line_num += 1} #{line}"
end



