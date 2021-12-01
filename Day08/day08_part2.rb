# frozen_string_literal: true

require 'pp'

file = File.open('input')

instructions = file.readlines.map(&:chomp).map do |instruction|
  instruction, value = instruction.split
  [instruction, value.to_i]
end

@acc = 0

def evaluate(index, instructions, visited)
  instruction, value = instructions[index]

  return false if visited[index]
  return true if index == instructions.length

  visited[index] = true

  case instruction
  when 'nop'
    evaluate(index + 1, instructions, visited)
  when 'acc'
    @acc += value
    evaluate(index + 1, instructions, visited)
  when 'jmp'
    evaluate(index + value, instructions, visited)
  else
    throw NotImplementedError
  end
end

(0..instructions.length - 1).each do |i|
  instruction, value = instructions[i]

  next if instruction == 'acc'

  changed_instructions = instructions.dup

  case instruction
  when 'nop'
    changed_instructions[i] = ['jmp', value]
  when 'jmp'
    changed_instructions[i] = ['nop', value]
  else
    throw NotImplementedError
  end

  @acc = 0
  puts @acc if evaluate(0, changed_instructions, [false] * changed_instructions.length)
end
