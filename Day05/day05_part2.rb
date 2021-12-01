input = 'input'

file = File.open(input)

seats = file.readlines.map(&:chomp)

def row_to_s(seat)
  seat.tr("FB", "01").to_i(2)
end

def col_to_s(seat)
  seat.tr("LR", "01").to_i(2)
end

seats_ids = seats.map { |seat|

  _, row, col = seat.partition(/.{7}/)

  rownumber = row_to_s(row)
  colnumber = col_to_s(col)

  rownumber * 8 + colnumber
}

puts (1..801).to_a - seats_ids
