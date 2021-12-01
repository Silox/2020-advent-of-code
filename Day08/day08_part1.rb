# frozen_string_literal: true

require 'pp'

file = File.open('input')

@instructions = file.readlines.map(&:chomp).map do |instruction|
  instruction, value = instruction.split
  [instruction, value.to_i]
end

@index = 0
@acc = 0
@visited = [false] * @instructions.length

def evaluate(index)
  instruction, value = @instructions[index]

  return if @visited[index]

  @visited[index] = true

  case instruction
  when 'nop'
    evaluate(index + 1)
  when 'acc'
    @acc += value
    evaluate(index + 1)
  when 'jmp'
    evaluate(index + value)
  end

end

evaluate(0)

puts @acc