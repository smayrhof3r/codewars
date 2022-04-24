def justify(text, width)
  text = text.split

  lines = split_lines(text, width)
  lines = buffer_lines(lines, width)

  return lines.map {|x| x.join} if lines.size == 1
  return lines.map {|x| x.join}.join("\n")
end

def split_lines(text, width)
  lines = []
  until text.empty?
    total = 0
    lines.push(text.shift(text.take_while.with_index { |word, i| (total += (word.to_s.length + (i > 0 ? 1 : 0 ))) <= width }.size))
  end
  lines
end

def buffer_lines(lines, width)
  if lines.size > 1
    lines[0..-2].each do |line|
      if line.count > 1
        line.map!.with_index { |word, i| i > 0 ? " " + word.to_s : word }
        spaces = [0] + [(width - line.join.length) / (line.count-1)]*(line.count-1)
        excess = width - line.join.length - spaces.sum
        (1..excess).each {|i| spaces[i] +=1 }
        line.map!.with_index { |word, i| i > 0 ? " " * spaces[i] + word.to_s : word }
      end
    end
  end
  lines
end

puts justify("   1234567890 i am really cool 123456789 that's cool 1234567890",11)
