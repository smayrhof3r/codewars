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

def path_length(path)
  char_start = path[0][0]
  char_end = path[1][0]

  int_start = path[0][1].to_i
  int_end = path[1][1].to_i

  #only look at options moving towards end goal. if symmetrical, doesn't matter
  int_direction = (int_start > int_end) || int_start === 8 ? -1 : 1
  char_direction = (char_start > char_end) || char_start === 'h' ? -1 : 1

  move1 = validmove((char_start.codepoints.first + 1*char_direction).chr + (int_start + 2*int_direction).to_s)
  move2 = validmove((char_start.codepoints.first + 2*char_direction).chr + (int_start + 1*int_direction).to_s)

  puts "#{path} -> #{move1} or #{move2}"
  return nil if (move1.nil? && move2.nil?)
  return 1 if (move1 === path[1] || move2 === path[1])

  cont_path = [path_length([move1, path[1]]), path_length([move2, path[1]])].min
  puts "#{path} -> #{move1} or #{move2} + #{cont_path}"
  return cont_path

end

def valid_move(move)
  return move if (1..8).to_a.include? move[0] && ('a'..'h').to_a.include? move[1]
end

path_length(["a2", "c6"])
path_length(["g6", "b3"])
puts ('b'.codepoints.first + 2).chr
