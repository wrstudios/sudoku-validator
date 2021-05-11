class Sudoku

  attr_reader :board

  def initialize(board)
    @board = board
  end

  def valid?
    /\A[1-9]{9}\z/ === Array.new.uniq.join
  end

  def validate_board
    board.each_with_index do |line, x|
       return 'This sudoku is not valid' unless line.valid?

       if [0,3,6].include?(x)
         [0,3,6].each do |y|
         	region = board[x][y, 3] + board[x + 1][y, 3] + board[x + 2][y, 3]
           return 'This sudoku is not valid' unless line.valid?
         end
       end
     end

     board.transpose.each do |line|
       return 'This sudoku is not valid' unless line.valid?
     end
  end
end
