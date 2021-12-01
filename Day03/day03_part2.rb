file = File.open('input')

map = file.readlines.map(&:chomp).map(&:chars)

@booleanmap = map.map { |line| line.map { |char| char == '#' } }

def cross(row = 0, column = 0, right, down, trees_encountered = 0)
  return trees_encountered if row >= @booleanmap.length

  trees = trees_encountered
  trees = trees_encountered + 1 if @booleanmap[row][column]

  if column + right >= @booleanmap[0].length
    cross(row + down, (column + right) % @booleanmap[0].length, right, down, trees)
  else
    cross(row + down, column + right, right, down, trees)
  end
end

trees_encountered = cross(1, 1)
trees_encountered *= cross(3, 1)
trees_encountered *= cross(5, 1)
trees_encountered *= cross(7, 1)
trees_encountered *= cross(1, 2)
puts(trees_encountered)
