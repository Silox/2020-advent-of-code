# frozen_string_literal: true

require_relative 'parser'

@rules = parse_file('input')

def content_fits?(contents, bag)
  color, = contents
  color == bag || (@rules[color].any? { |content_color| content_fits?(content_color, bag) })
end

def rule_fits?(rule, bag)
  _, contents = rule

  contents.any? { |content| content_fits?(content, bag) }
end

def fits(bag)
  @rules.count do |rule|
    rule_fits?(rule, bag)
  end
end

puts fits('shiny gold')
