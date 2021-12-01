# frozen_string_literal: true

require 'pp'

file = File.open('input')

@numbers = file.readlines.map(&:chomp).map(&:to_i)
# @to_find = 127
@to_find = 3_199_139_634

(0...@numbers.length).each do |lower|
  too_big = false

  ((lower + 1)...@numbers.length).each do |upper|
    range = @numbers[lower..upper]
    puts range.min + range.max if range.sum == @to_find

    too_big = true if range.sum > @to_find
  end

  next if too_big
end
