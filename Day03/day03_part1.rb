file = File.open("input")

map = file.readlines.map(&:chomp).map(&:chars)

booleanmap = map.map { |line| line.map { |char| char == '#' } }

def cross(map, row, column, right, down, trees_encountered)
  if row >= map.length
    return trees_encountered
  end

  trees = trees_encountered
  if map[row][column]
    trees = trees_encountered + 1
  end

  if column + right >= map[0].length
    cross(map, row + down, (column + right) % map[0].length, right, down, trees)
  else
    cross(map, row + down, column + right, right, down, trees)
  end
end

trees_encountered = cross(booleanmap, 0, 0, 3, 1, 0)
puts(trees_encountered)