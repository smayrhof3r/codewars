function expandedForm(num) {
  // Your code here
  return Array.from(String(num))
              .map((digit, i) => digit * (10 ** (String(num).length - i - 1)))
              .filter(digit => digit > 0)
              .join(" + ");
}

console.log(expandedForm(1234));
