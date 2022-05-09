/*
get change in largest possible bills
https://www.codewars.com/kata/5966f6343c0702d1dc00004c
*/
function giveChange(amount) {
  values = [1,5,10,20,50,100];
  change = Array(6).fill(0);
  for (let i = 5; i >= 0; i--) {
      change[i] = Math.floor(amount / values[i]);
      amount -= change[i] * values[i];
      if (amount == 0) { break; }
  }
  return change;
}
