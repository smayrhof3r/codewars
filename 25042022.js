var humanYearsCatYearsDogYears = (humanYears) => {
  // Your code here!
  let catYrs = 15 + (humanYears > 1 ? 9 : 0) + (humanYears > 2 ? 4 * (humanYears - 2) : 0);
  let dogYrs = 15 + (humanYears > 1 ? 9 : 0) + (humanYears > 2 ? 5 * (humanYears - 2) : 0)
  return [humanYears, catYrs, dogYrs];
}
