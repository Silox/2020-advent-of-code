# frozen_string_literal: true

file = File.open('input')

answers = file.read.split("\r\n\r\n").map { |each| each.chars.uniq.filter { |letter| letter.match?(/[a-z]/) } }

puts answers.map(&:length).sum
