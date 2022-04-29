# For this kata you will be extending the Hash class to support a new method called 'flattened_keys'. The purpose of this method is to return a new hash that has any nested values flattened so that there is only the single root hash structure. The keys from the nested hash will be merged into the parent, separated by underscores.

# Basic example:

# unflat = {id: 1, info: {name: 'example'}}.flattened_keys
# unflat.flattened_keys # equals {id: 1, info_name: 'example'}
# # notice the info_name flattened key
# The method should handle any level of nesting.

Hash.class_eval {
  def flattened_keys
    hash = self.merge
    hash.each_pair.cycle {|k, v|
      hash = hash.merge(hash.delete(k).transform_keys! {|key| "#{k.to_s}_#{key.to_s}".to_sym }) if v.class == Hash
      break if hash.values.filter{ |val| val.class == Hash}.empty?
    }
    return hash
  end
}

unflat = {id: 1, info: {name: 'example'}}
p unflat.flattened_keys # equals {id: 1, info_name: 'example'}
