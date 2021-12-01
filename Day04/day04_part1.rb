file = File.open('input')

passports = file.read.split("\r\n\r\n").map(&:chomp).map do |line|
  line.split.to_h { |pair| pair.split(':') }
end

def valid?(passport)
  %w[byr iyr eyr hgt hcl ecl pid].all? { |s| passport.key? s }
end

puts passports.count { |passport| valid?(passport) }
