file = File.open('input')

passports = file.read.split("\r\n\r\n").map(&:chomp).map do |line|
  line.split.to_h { |pair| pair.split(':') }
end

def valid_height?(height)
  h = height.match(/^(?<length>\d+)(?<unit>\w\w)$/)

  return false unless h

  return h[:length].to_i >= 150 && h[:length].to_i <= 193 if h[:unit] == 'cm'

  return h[:length].to_i >= 59 && h[:length].to_i <= 76 if h[:unit] == 'in'

  false
end

def valid_hair?(hair)
  hair.match(/^#[0-9a-f]{6}$/)
end

def valid_eye_color?(eye_color)
  %w[amb blu brn gry grn hzl oth].include?(eye_color)
end

def valid?(passport)
  return false unless %w[byr iyr eyr hgt hcl ecl pid].all? { |s| passport.key? s }

  byr = passport['byr']
  return false unless byr.length == 4 && byr.to_i >= 1920 && byr.to_i <= 2002

  iyr = passport['iyr']
  return false unless iyr.length == 4 && iyr.to_i >= 2010 && iyr.to_i <= 2020

  eyr = passport['eyr']
  return false unless eyr.length == 4 && eyr.to_i >= 2020 && eyr.to_i <= 2030

  hgt = passport['hgt']
  return false unless valid_height?(hgt)

  hcl = passport['hcl']
  return false unless valid_hair?(hcl)

  ecl = passport['ecl']
  return false unless valid_eye_color?(ecl)

  pid = passport['pid']
  return false unless pid.match(/^\d{9}$/)

  true
end

valid_passports = passports.filter { valid?(_1) }
puts(valid_passports.length)
