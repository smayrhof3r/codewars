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

#returns arr of squares that add up to n OR [] if none
  print "enter with #{n}..."
  val = (n*n)
  return [] if sum_squ_1to(n-1) < (val)
  return rec_sum_of_sq(val, n-1)

end

def sum_squ_1to(n)
  (n * (n + 1) * ((2*n) + 1)) / 6
end

def rec_sum_of_sq(val, max_n)
  n = Math.sqrt(val).floor #start with nearest rounded down integer

  n -= 1 if n > max_n #for first recurse
  t = sum_squ_1to(n)
  puts "rec_enter with val #{val}...evaluate with n = #{n}"
  puts "check if possible: #{t} : #{t >= val}"

  puts "case 1: []" if sum_squ_1to(n) < val
  puts "case (n..1).to_a" if sum_squ_1to(n) === val
  puts "case [n]" if n*n === val
  return [] if sum_squ_1to(n) < val
  return (1..n).to_a.reverse if sum_squ_1to(n) === val
  return [n] if n*n === val
  puts "case recurse"
  x = n
  result = []
  loop do
    r = val - (x*x)
    puts "#{x} : remainder : #{r}"
    result = rec_sum_of_sq(r, x-1)
    puts "#{x} : result : #{result}"
    break if result.count > 0 || x === 1
    x -= 1
  end
  result = result.count > 0 ? [x] + result : [x]
  check_val = result.map {|x| x*x}.reduce(&:+)
  puts "result val : #{check_val}"
  retVal = check_val == val ? result : []
  puts "#{n}.................returns: #{retVal}"
  return retVal
end

puts "#{sum_of_squares(4)}"
#25 16 9 4 1
