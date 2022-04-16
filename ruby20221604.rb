def top_3_words(text)
  freq = Hash.new(0)

  text.split(" ").each {|word|
    word = word.delete(word.delete "[a-zA-Z' ]").downcase
    freq[word] += 1 }

  puts "#{freq.sort_by {|k, v| v}.map {|x| x[0]}.slice([-3, -freq.count].max..-1).reverse}"
end

top_3_words("In a village of La Mancha, the name of which I have no desire to call to
  mind, there lived not long since one of those gentlemen that keep a lance
  in the lance-rack, an old buckler, a lean hack, and a greyhound for
  coursing. An olla of rather more beef than mutton, a salad on most
  nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
  on Sundays, made away with three-quarters of his income.")
  # => ["a", "of", "on"]

top_3_words("e e e e DDD ddd DdD: ddd ddd aa aA Aa, bb cc cC e e e")
  # => ["e", "ddd", "aa"]

top_3_words("  //wont won't won't")
  # => ["won't", "wont"]
