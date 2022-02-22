class Board
  
  def initialize(size = 3)
    @size = size
    @board = Array.new(size) { Array.new(size, '.')}
  end
  
end
