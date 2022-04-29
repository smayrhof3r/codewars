# Given a hash of letters and the number of times they occur, recreate all of the possible anagram combinations that could be created using all of the letters, sorted alphabetically.
# The inputs will never include numbers, spaces or any special characters, only lowercase letters a-z.
# E.g. get_words({2=>["a"], 1=>["b", "c"]}) => ["aabc", "aacb", "abac", "abca", "acab", "acba", "baac", "baca", "bcaa", "caab", "caba", "cbaa"]


def get_words(hash)
  hash.each_pair {|freq, letters| (freq-1).times { hash[freq] += letters} }
                                          .values
                                          .flatten
                                          .permutation
                                          .to_a
                                          .map(&:join)
end

p get_words({2=>["a"], 1=>["b", "c"]})
