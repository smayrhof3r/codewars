function joust(listField, vKnightLeft, vKnightRight) {

  // console.log(listField[0].indexOf(">"))
  // console.log(listField[1].indexOf("<"))
  // 2 + x*1 >= 4 - x*2
  // (1*x) + (2*x) >= (4 - 2))
  // (1 + 2)*x >= (4-2)
  // x >= 4-2 / (1+2)
  // roundup(p2 - p1)/(vknightleft + vknightRight)
  moves = Math.ceil((listField[1].indexOf("<") - listField[0].indexOf(">"))/(vKnightLeft + vKnightRight)) ;

  if (moves <= 0) { return listField; }
  if (vKnightLeft > 0) { listField[0] = [...new Array(moves*vKnightLeft).fill(" "), ...listField[0].slice(0, -moves*vKnightLeft)].join(''); }
  if (vKnightRight > 0)	{ listField[1] = [...listField[1].slice(moves*vKnightRight, ), ...new Array(moves*vKnightRight).fill(" ")].join(''); }

  return listField;
}
