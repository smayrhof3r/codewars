def valid(arr)
  puts valid_row(arr)
  puts valid_column(arr)
  valid_row(arr) && valid_column(arr) && valid_square(arr)
end

def valid_row(arr)
  arr.each{|row| return false if row.sort != (1..9).to_a }
  true
end

def valid_column(arr)
  arr.transpose.each{|row| return false if row.sort != (1..9).to_a }
  true
end

def valid_square(arr)
  square = []
  (1..3).each {|x|
    rows = arr.shift(3)
    (1..3).each {|y|
      square.push([])
      rows.each {|row| square[-1] += row.shift(3) }
    }
    return false if square[-1].sort != (1..9).to_a
  }
  true
end

puts test([[5, 3, 4, 6, 7, 8, 9, 1, 2],
  [6, 7, 2, 1, 9, 5, 3, 4, 8],
  [1, 9, 8, 3, 4, 2, 5, 6, 7],
  [8, 5, 9, 7, 6, 1, 4, 2, 3],
  [4, 2, 6, 8, 5, 3, 7, 9, 1],
  [7, 1, 3, 9, 2, 4, 8, 5, 6],
  [9, 6, 1, 5, 3, 7, 2, 8, 4],
  [2, 8, 7, 4, 1, 9, 6, 3, 5],
  [3, 4, 5, 2, 8, 6, 1, 7, 1]])

def test(board)
  board.map{|row| row.each_slice(3).to_a}
end
