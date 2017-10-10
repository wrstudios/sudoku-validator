require_relative '../lib/sudoku'

describe Sudoku do
  let(:file) do
    File.read("spec/fixtures/simple.sudoku")
  end

  let(:grid) do
    [
      [1, 1, 1, 1, 1, 1, 1, 1, 1],
      [2, 2, 2, 2, 2, 2, 2, 2, 2],
      [3, 3, 3, 3, 3, 3, 3, 3, 3],
      [4, 4, 4, 4, 4, 4, 4, 4, 4],
      [5, 5, 5, 5, 5, 5, 5, 5, 5],
      [6, 6, 6, 6, 6, 6, 6, 6, 6],
      [7, 7, 7, 7, 7, 7, 7, 7, 7],
      [8, 8, 8, 8, 8, 8, 8, 8, 8],
      [9, 9, 9, 9, 9, 9, 9, 9, 9],
    ]
  end

  describe '.parse' do
    it 'parses a Sudoku grid from a string' do
      expect(Sudoku.parse(file).grid).to eq(grid)
    end
  end

  describe '#rows' do
    it 'returns the Sudoku row-wise' do
      expect(Sudoku.new(grid).rows).to eq(grid)
    end
  end

  describe '#cols' do
    it 'returns the Sudoku column-wise' do
      expect(Sudoku.new(grid).cols).to eq(
        Array.new(9) { [1, 2, 3, 4, 5, 6, 7, 8, 9] }
      )
    end
  end

  describe '#groups' do
    it 'returns the subgroups' do
      groups =
        Array.new(3) { [1, 1, 1, 2, 2, 2, 3, 3, 3] } +
        Array.new(3) { [4, 4, 4, 5, 5, 5, 6, 6, 6] } +
        Array.new(3) { [7, 7, 7, 8, 8, 8, 9, 9, 9] }

      expect(Sudoku.new(grid).groups).to eq(groups)
    end
  end
end
