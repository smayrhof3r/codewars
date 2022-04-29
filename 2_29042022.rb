# Write a method which takes arguments:

# hash
# keys (comma-separated symbols or strings)
# and it splits hash by given keys and returns array of hashes.

# If a key given as an argument is not present in the hash, the method should raise an exception

# In case there are any empty hash after splitting, it should be removed from resultant array.

# For example:

# # returns [ {:a=>1, :b=>2}, {:c=>3, :d=>4}, {:e=>5, :f=>6} ]
# split_hash_by_key( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, :c, :e )

def split_hash_by_key(hash, *args)
  slice = [[]]
  hash.keys.each_with_index {|k, i| (args.include? k) ? slice.push([k]) : slice[-1].push(k) }
  slice.map { |keys| hash.slice(*keys) }.reject { |h| h.empty? }
end

def split_hash_by_key2(hash, *args)
  slice = []
  keys = hash.keys
  args.each {|k| slice.push(keys.shift(keys.index(k))) }
  slice.push(keys).map { |k| hash.slice(*k) }.reject { |h| h.empty? }
end
p split_hash_by_key2( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, :c, :e )
