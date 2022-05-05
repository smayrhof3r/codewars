# [1, 1, 1, 1, 1, 1, 1]
# [0, 0, 0, 0, 0, 0, 1]
# [0, 1, 1, 1, 1, 0, 1]
# [0, 1, 0, 0, 1, 0, 1]
# [0, 1, 0, 1, 1, 0, 1]
# [0, 1, 0, 0, 0, 0, 1]
# [0, 1, 1, 1, 1, 1, 1]
def spiralize(size)
  spiral = Array.new(size) {Array.new(size).fill(0)}

  # set up: r = current row, c = current column, length = length of 1s on current row or col.
  #         fill in first row as does'nt follow pattern
  r = 0; c = -1; length = size-1; spiral[0].fill(1)

  # cycle through incremenation pattern: [row, col, length of 1s on given line]
  [[0, 1, 0], [-1, 0, -2], [0, -1, 0], [1, 0, -2]].cycle do |direction|
    length.times do
      c += direction[0]
      r += direction[1]
      spiral[r][c] = 1
    end

    length += direction[2]

    break if (length == 1 && direction[2] == 0) || length <= 0

  end
 spiral
end

result = spiralize(8)
result.each { |r| p r }
