text = "hi hi hi THIS this"

def top_3_words(text)
  freq = Hash.new(0)
  text.split(" ").each {|word| freq[word] += 1 }
  puts "#{freq.sort_by {|k, v| v}.map {|x| x[0]}.slice([-3, -freq.count].max..-1)}"
end

top_3_words(text)
