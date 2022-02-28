class Board
  attr_reader :board, :size

  @@win_O = Array.new(3, "O")
  @@win_X = Array.new(3, "X")
  
  def initialize
    @size = 3
    @board = Array.new(size) { Array.new(size, '.')}
  end

  def print_board
    print "\t     "
    print [1, 2, 3] * "   "
    puts

    print "\t   "
    print " \u2015" * (size * 2)
    puts
    
    board.each_with_index { |row, idx| 
      print "\t #{("A".."C").to_a[idx]} \u2502 "
      print row * " \u2502 "
      puts " \u2502"
      print "\t   "
      print " \u2015" * (size * 2)
      puts
    }
  end

  def full?
    board.none? {|row| row.include?(".")}
  end

  def wins?
    (0..2).each do |index|
      return true if board[index] == @@win_O || board[index] == @@win_X
      return true if board.map { |row| row[index]} == @@win_O || board.map { |row| row[index]} == @@win_X
    end
    return true if (0..2).collect { |index| board[index][index]} == @@win_O || (0..2).collect { |index| board[index][index]} == @@win_X
    return true if (0..2).collect { |index| board[index][2 - index]} == @@win_O || (0..2).collect { |index| board[index][2 - index]} == @@win_X
    false
  end
  
  def self.clear
    print "\e[2J\e[f"
  end

  def self.win_O
    @@win_O
  end

  def self.win_X
    @@win_X
  end
  
end


