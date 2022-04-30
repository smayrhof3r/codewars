// An eccentric chessboard maker likes to create strange N x N chessboards.
// Instead of making all the rows and the columns on his chessboards the same size, he likes to make chessboards with row and columns of varying sizes:
// For example, here are the specifications of his latest 5x5 chessboard:
// cs = [ 3, 1, 2, 7, 1 ] contains the 5 widths of the 5 columns.
// rs = [ 1, 8, 4, 5, 2 ] contains the 5 heights of the 5 rows.
// To be clear, reading the examples of cs and rs above, the width of the 4th column on the chessboard is 7, the height of the 2nd row on the chessboard is 8, etc.
// Notice, by the way, that since sum(cs) != sum(rs), the total width of the strange chessboard is not necessarily the same as the total height.
// The chessboard maker now wants to determine how much white and black wood he needs to cover the areas in a given chessboard, so is asking you to find the total white area and the total black area on his board.

function whiteBlackAreas2(cols, rows) {
  //even rows, odd rows
  const even_rows = rows.filter((e, i) => i % 2 == 0).reduce((a, b) => a + b);
  const odd_rows = rows.filter((e,i) => i % 2 == 1).reduce((a, b) => a + b);
  const even_cols = cols.filter((e, i) => i % 2 == 0).reduce((a, b) => a + b);
  const odd_cols = cols.filter((e,i) => i % 2 == 1).reduce((a, b) => a + b);

  return [even_rows*even_cols + odd_rows*odd_cols, even_cols*odd_rows + odd_cols*even_rows];
}
