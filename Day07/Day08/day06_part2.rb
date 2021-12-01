# frozen_string_literal: true

file = File.open('input')

answers = file.read.split("\r\n\r\n").map { |answers| answers.lines.map(&:chomp).map(&:chars).reduce { |it, n| it & n } }

puts answers.map(&:count).sum
