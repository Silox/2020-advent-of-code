# frozen_string_literal: true

require_relative 'parser'

@rules = parse_file('input')

def count_bags(bag)
  contents = @rules[bag]

  return 0 if contents.length.zero?

  (contents.map do |content|
    color, amount = content
    amount + (amount * count_bags(color))
  end).sum
end

puts count_bags('shiny gold')
