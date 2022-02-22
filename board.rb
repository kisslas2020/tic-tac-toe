class Board
  attr_reader :board, :size
  
  def initialize(size = 3)
    @size = size
    @board = Array.new(size) { Array.new(size, '.')}
  end

  def print_board
    print "\t"
    print " \u2015" * (size * 2)
    puts
    board.each { |row| 
      print "\t\u2502 "
      print row * " \u2502 "
      puts " \u2502"
      print "\t"
      print " \u2015" * (size * 2)
      puts
    }
  end

  def full?
    board.none? {|row| row.include?(".")}
  end
  
  def self.clear
    print "\e[2J\e[f"
  end

  
end
