file = File.open("input")

lines = file.readlines.map(&:chomp)

def is_valid?(line)
  lines, letter, password = line.split(" ")
  min, max = lines.split("-").map(&:to_i)
  letter = letter[0]

  occurences = password.scan(/#{letter}/).length

  occurences.between?(min, max)
end

puts lines.count { |l| is_valid?(l) }

