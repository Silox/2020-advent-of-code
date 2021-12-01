# frozen_string_literal: true

require 'pp'

# file = File.open('input_small')
# file = File.open('input_medium')
file = File.open('input')

@jolts = file.readlines.map(&:chomp).map(&:to_i).sort.prepend(0)
pp @jolts

@cache = [nil] * @jolts.length

def count(index)

  return 1 if index == @jolts.length - 1

  return @cache[index] if @cache[index]

  count = (1..3).map do |i|
    count(index + i) if @jolts[index + i] && @jolts[index + i] - @jolts[index] <= 3
  end.compact.sum

  @cache[index] = count

  count
end

puts count(0)
