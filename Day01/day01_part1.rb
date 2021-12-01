file = File.open("input")

input = file.readlines.map(&:chomp).map(&:to_i)

input.each_index do |i|
  input.each_index do |j|
    if i != j and (input[i] + input[j]) == 2020
      puts input[i] * input[j]
    end
  end
end