=begin
Given two different positions on a chess board, find the least number of moves
it would take a knight to get from one to the other. The positions will be passed
 as two arguments in algebraic notation. For example, knight("a3", "b5") should
 return 1.

The knight is not allowed to move off the board. The board is 8x8.

For information on knight moves, see
https://en.wikipedia.org/wiki/Knight_%28chess%29

For information on algebraic notation, see
https://en.wikipedia.org/wiki/Algebraic_notation_%28chess%29*/
=end


def knight(start, finish)
  path_length(start, finish, "")
end

def path_length(start, finish, totalpath)
  char_start = start[0]
  char_end = finish[0]

  int_start = start[1].to_i
  int_end = finish[1].to_i

  #only look at options moving towards end goal. if symmetrical, doesn't matter
  int_direction = (int_start > int_end) || int_start === 8 ? -1 : 1
  char_direction = (char_start > char_end) || char_start === 'h' ? -1 : 1

  move1, totalpath = valid_move((char_start.codepoints.first + 1*char_direction).chr + (int_start + 2*int_direction).to_s, totalpath)
  move2, totalpath = valid_move((char_start.codepoints.first + 2*char_direction).chr + (int_start + 1*int_direction).to_s, totalpath)

  return 10000 if (move1.nil? && move2.nil?)
  return 1 if (move1 == finish || move2 == finish)

  next_move1 = move1.nil? ? 10000 : path_length(move1, finish, totalpath)
  next_move2 = move2.nil? ? 10000 : path_length(move2, finish, totalpath)

  1 + [next_move1, next_move2].min

end

def valid_move(move, totalpath)
  valid_row = ((1..8).to_a).include? move[1].to_i
  valid_col = (('a'..'h').to_a).include? move[0]
  new_move = !(totalpath.include? move)
  totalpath += move if new_move
  return (valid_row && valid_col && new_move) ? [move, totalpath] : [nil, totalpath]
end

puts knight('a1', 'c1')
puts knight('a1', 'f1')
puts knight('a1', 'f3')
puts knight('a1', 'f4')
puts knight('a1', 'f7')
