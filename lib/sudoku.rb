class Sudoku
  attr_reader :grid

  def initialize(grid)
    @grid = grid
  end

  # Parses and creates a Sudoku from a string
  def self.parse(str)
    grid = str.lines.reject do |line|
      line =~ /-/
    end.map do |line|
      line.split(/\s\|?/).map(&:to_i)
    end

    new grid
  end

  # Returns the grid row-wise (array of rows)
  def rows
    @grid
  end

  # Returns the grid column-wise (array of columns)
  def cols
    @grid.transpose
  end

  # Returns the grid in sub-groups (array of groups)
  def groups
    @grid.each_slice(3).flat_map do |rows|
      slices = rows.map { |row| row.each_slice(3).to_a }
      [
        slices.map(&:first),
        slices.map { |s| s[1] },
        slices.map(&:last)
      ].map(&:flatten)
    end
  end
end
