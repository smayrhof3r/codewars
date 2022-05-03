# Earlier this year I was in a contest on HackerRank which included a code golf-style challenge to write a regular expression of 50 or fewer characters that could determine whether or not a tic tac toe (also known as noughts and crosses or Xs and Os) board had a winner.
# I'm not going to force you to keep your regex at or under 50 characters here, or even force you to use a regex if you really don't want to (though if you really don't want to write a regex, why don't you do one of the other tic tac toe katas here instead?), but why not challenge yourself, maybe learn something, and perhaps earn some Best Practices/Clever honor points for yourself as well?
# Your function will receive a string of nine "X", "O", and/or "-" characters representing the state of a tic tac toe board, for example the string
# "X-OXXXO-O"
# would represent the board
# X-O
# XXX
# O-O
# where player X has won by getting three in a row horizontally on the middle row.
# Your function needs to return True/true/TRUE (depending on the language you're using) if either the X or the O player has won the game by getting three in a row vertically, horizontally, or diagonally; or False/false/FALSE if there is no winner.
# A few more examples:
# "---------" - False - no one has even made a move yet!
# "XOOOXXXXO" - False - no one got three in a row here.
# "OXO-XOX-O" - True - player O won by getting three in a row vertically in the third column.

  def regex_tic_tac_toe_win_checker(board)
    /(?=X{3}|O{3}|X..X..X|O..O..O|X...X...X|O...O...O)/~=board
  end
