/*Consider the word "abode". We can see that the letter a is in position 1
and b is in position 2. In the alphabet, a and b are also in positions 1 and
2. Notice also that d and e in abode occupy the positions they would occupy
in the alphabet, which are positions 4 and 5.

Given an array of words, return an array of the number of letters that occupy
 their positions in the alphabet for each word. For example,

solve(["abode","ABc","xyzD"]) = [4, 3, 1]*/

let alphabet = Array.from(Array(26).keys())
                    .map((num) => { return String.fromCharCode(num + 97); })

function solve (arr) {
  return arr.map((item) => {
    total = 0;
    for (let i = 0; i < item.length; i++) {
      if (item.toLowerCase()[i] == alphabet[i]) { total += 1; }
    }
    return total;
  });
};

console.log(solve(["abs", "sbce", "fff", ""]));
