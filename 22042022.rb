def hamming(n)
  hams = []
  ham = 1
  count = 1

  (n-1).times do
    hams += [ham*2, ham*3, ham*5]
    hams.uniq
    ham = hams.delete(hams.min)
  end

  return ham
end

puts hamming(5000)
