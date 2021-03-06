function sumDigPow(a, b) {
  // Your code here
  range = [...Array(b-a+1).keys()].map(e => e + a);
  powers = range.map((number, index) => Array.from(String(number)).map((digit, i) => digit**(i+1)).reduce((a, b)=>a+b, 0));
  return range.filter((val, index) => val == powers[index]);
}

console.log(sumDigPow(10,100))
