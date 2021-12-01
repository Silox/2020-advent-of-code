# frozen_string_literal: true

require 'pp'

file = File.open('input_small')

@numbers = file.readlines.map(&:chomp).map(&:to_i)
@preamble = 25
@buffer = 25

def valid?(i)
  number = @numbers[i]

  (i - @buffer...i).any? do |k|
    (i - @buffer...i).any? do |l|
      false if k == l

      @numbers[k] + @numbers[l] == number
    end
  end
end

(@preamble...@numbers.length).each do |i|
  puts @numbers[i] unless valid?(i)
end
