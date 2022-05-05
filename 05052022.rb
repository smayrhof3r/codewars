# [1, 1, 1, 1, 1, 1, 1]
# [0, 0, 0, 0, 0, 0, 1]
# [0, 1, 1, 1, 1, 0, 1]
# [0, 1, 0, 0, 1, 0, 1]
# [0, 1, 0, 1, 1, 0, 1]
# [0, 1, 0, 0, 0, 0, 1]
# [0, 1, 1, 1, 1, 1, 1]
def spiralize(size)
  spiral = Array.new(size) {Array.new(size).fill(0)}
  r = 0; c = -1
  length = size

  [[1, 0], [0, 1], [-1, 0], [0, -1]].cycle do |direction|
    length.times do
      c += direction[0]
      r += direction[1]
      spiral[r][c] = 1
    end

    length -= 1
    break if length == 0
  end
 spiral
end

result = spiralize(6)
result.each { |r| p r }
