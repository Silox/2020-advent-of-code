file = File.open("input")

input = file.readlines.map(&:chomp).map(&:to_i)

input.each_index do |i|
  input.each_index do |j|
    input.each_index do |k|
      if i != j and j != k and (input[i] + input[j] + input[k]) == 2020
        puts input[i] * input[j] * input[k]
      end
    end
  end
end