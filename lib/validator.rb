class Validator
  def initialize(puzzle_string)
    @puzzle_string = puzzle_string
  end

  def self.validate(puzzle_string)
    new(puzzle_string).validate
  end

  def validate
    sudoku = Sudoku.parse(@puzzle_string)

    # Validate rows, columns, and sub-groups
    rows_valid = sudoku.rows.all? { |row| valid?(row) }
    cols_valid = sudoku.cols.all? { |col| valid?(col) }
    groups_valid = sudoku.groups.all? { |grp| valid?(grp) }

    if rows_valid && cols_valid && groups_valid
      # A Sudoku being valid does not mean it's solved
      if sudoku.rows.any? { |row| row.count(0) > 0 }
        "This sudoku is valid, but incomplete."
      else
        "This sudoku is valid."
      end
    else
      "This sudoku is invalid."
    end
  end

  private

  def valid?(array)
    (1..9).all? { |i| array.count(i) <= 1 }
  end

end
