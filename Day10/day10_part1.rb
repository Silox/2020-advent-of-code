# frozen_string_literal: true

require 'pp'

# file = File.open('input_small')
# file = File.open('input_medium')
file = File.open('input')

jolts = file.readlines.map(&:chomp).map(&:to_i).sort
differences = jolts.each_cons(2).map { |a, b| b - a }
puts (1 + differences.count(1)) * (differences.count(3) + 1)
