# 'light red' -> [['bright white', 1], [['muted yellow', 2]]
def parse(line)
  bag_color = line.split.take(2).join(' ')
  rest = line.split(/ /, 5)[-1].split[0..-1].join(' ')[0...-1]

  if rest == 'no other bags'
    [bag_color, []]
  else
    contents = rest.split(/, /).map do |it|
      amount = it.split[0]
      color = it.split[1...3].join(' ')
      [color, amount.to_i]
    end

    [bag_color, contents]
  end
end

def parse_file(filename)
  file = File.open(filename)
  file.readlines.map(&:chomp).map { |it| parse(it) }.to_h
end
