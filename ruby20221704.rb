=begin
Task
Given a positive integral number n, return a strictly increasing sequence
(list/array/string depending on the language) of numbers, so that the sum of the squares is equal to n².

If there are multiple solutions (and there will be), return as far as possible the result with the
largest possible values:

Examples
decompose(11) must return [1,2,4,10]. Note that there are actually two ways to decompose 11²,
11² = 121 = 1 + 4 + 16 + 100 = 1² + 2² + 4² + 10² but don't return [2,6,9], since 9 is smaller than 10.

For decompose(50) don't return [1, 1, 4, 9, 49] but [1, 3, 5, 8, 49] since [1, 1, 4, 9, 49] doesn't form
 a strictly increasing sequence.

Note
Neither [n] nor [1,1,1,…,1] are valid solutions. If no valid solution exists, return nil, null, Nothing,
None (depending on the language) or "[]" (C) ,{} (C++), [] (Swift, Go).

## idea ##
use a tree, starting with largest option (n-1)^2 and solve for remaining tree below (stop when sum of components
  too small to meet the need); if that doesn't work, move on to next option of solving from n-1 and so on.
=end

def sum_of_squares(n)
  result = rec_sum_of_sq(n*n, n-1)
  return result.empty? ? nil : result
end

def sum_squ_1to(n)
  (n * (n + 1) * ((2*n) + 1)) / 6
end

def rec_sum_of_sq(remainder, n_minus_1)
  #next n must be lesser of remaining value vs. n-1
  n = [Math.sqrt(remainder).floor, n_minus_1].min

  #we can stop if remainder can't be met (or is exactly met) by full series
  sum_1_to_n = sum_squ_1to(n)

  return [] if sum_1_to_n < remainder
  return (1..n).to_a if sum_1_to_n === remainder

  #else we loop through tree until we find a path that works
  x = n; result = []
  loop do
    result = rec_sum_of_sq(remainder - (x*x), x-1)

    #break if end of path, no solution possible, or solution found
    break if (result.length > 0 || x === 1) || sum_squ_1to(x-1) < remainder

    x -= 1
  end

  result = result + [x]

  result.map {|x| x*x}.reduce(&:+) == remainder ? result : []
end

puts "#{sum_of_squares(50)}"

#25 16 9 4 1
