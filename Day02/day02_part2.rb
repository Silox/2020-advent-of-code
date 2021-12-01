file = File.open("input")

lines = file.readlines.map(&:chomp)

def is_valid?(line)
  lines, letter, password = line.split(" ")
  index1, index2 = lines.split("-").map(&:to_i)
  letter = letter[0]

  (password[index1 - 1] == letter) ^ (password[index2 - 1] == letter)
end

puts lines.count { |l| is_valid?(l) }

