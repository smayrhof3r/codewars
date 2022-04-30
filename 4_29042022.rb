# simple helper function to build trees more easily
class TreeNode
  attr_accessor :left
  attr_accessor :right
  attr_accessor :value
  def initialize
    @value = nil
    @right = nil
    @left = nil
  end
end

def buildTree(node,arr)
  node.value = arr.shift
  size = (arr.size/2.0).round
  if size > 0
    left, right = arr.each_slice( size ).to_a
    if left and left.count > 0
      node.left = TreeNode.new
      buildTree(node.left, left)
    end
    if right and right.count > 0
      node.right = TreeNode.new
      buildTree(node.right, right)
    end
  end
end

tree1 = TreeNode.new
tree2 = TreeNode.new
tree3 = TreeNode.new
tree4 = TreeNode.new
tree5 = TreeNode.new
tree6 = TreeNode.new
tree7 = TreeNode.new

buildTree(tree1,[1])
buildTree(tree2,[2,8,9,1,3,4,5])
buildTree(tree3,[421,423,23,1,1,1,1,1,1,1,324,432,3,2,1,34,6])
buildTree(tree4,[1,2,3,4,5,6,7,8,9])
buildTree(tree6,[1] * 100)
buildTree(tree7,[9,1,1,1,1,4,7])

def printTree(tree, arr, level)
  # p "#{level} : #{arr[level]}"
  return [] if tree == nil
  arr.length > level ? arr[level].push(tree.value) : arr.push([tree.value])
  tree.left ? arr = printTree(tree.left, arr, level + 1) : (arr.length > level+1 ? arr[level+1] << " " : arr.push([" "]))
  tree.right ? arr = printTree(tree.right, arr, level + 1) : (arr.length > level+1 ? arr[level+1] << " " : arr.push([" "]))
  if level == 0
    blocks = (1..arr.size).to_a
    blocks.map! {|v| v > 1 ? blocks[v-2]*2 + 1 : 1 }
    arr.each_with_index {|v, i|
      puts v.map{|str| str.to_s.center(blocks[-i-1])}.join(" ")
    }
  end

  arr

end

# return the array containing the tree levels, from root to last level.
def tree_by_levels(node)
  flattenTree(node, [[]], 0)
end

def flattenTree(tree, arr, level)
  return [] if tree == nil
  arr.length > level ? arr[level] << tree.value : arr.push([tree.value])
  arr = flattenTree(tree.left, arr, level + 1) if tree.left
  arr = flattenTree(tree.right, arr, level + 1) if tree.right
  return level == 0 ? arr.flatten(1) : arr
end

p tree_by_levels(tree1)
p tree_by_levels(tree2)
p tree_by_levels(tree3)
p tree_by_levels(tree4)
p tree_by_levels(tree5)
p tree_by_levels(tree6)
p tree_by_levels(tree7)
