def done_or_not board
  criteria = (0..9).to_a
  row_complete = board.all? do |row|
    (criteria - row).empty?
  end

  columns = board.transpose
  column_complete = columns.all? do |column|
    (criteria - column).empty?
  end

  sections = board.each_slice(27).to_a
  boxes = sections.map { |section| section.each_slice(4).to_a }.transpose
  boxes = boxes.map do |section|
    section.map do |box|
      box.flatten
    end
  end
end
