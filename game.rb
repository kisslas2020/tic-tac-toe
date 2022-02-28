require './board'
require './player'


class Game
  attr_reader :board, :playerA, :playerB

  def initialize(board, playerA, playerB)
    @board = board
    @playerA = playerA
    @playerB = playerB
  end

  def play
    actual = playerB
    until ended?
      actual = actual == playerA ? playerB : playerA
      print_game("#{actual.name} is next. What is your choice (e.g. A1)? ")
      get_choice(actual)
      
      
    end
      announcement(actual)
  end

  private

  def print_game(text)
    Board.clear
    puts
    puts "\t    TIC TAC TOE"
    puts
    board.print_board
    puts
    print text
  end

  def get_choice(actual)
    loop do
      choice = gets.chomp
      row, col = choice.downcase.split("")
      col = Integer(col) rescue nil
      if !(('a'..'c').include?(row) && (1..3).include?(col))
        print_game("Invalid choice! Try again, #{actual.name}: ")
      elsif board.board[row.ord - 97][col - 1] != "."
        print_game("That field is already taken! Try again, #{actual.name}: ")
      else
        board.board[row.ord - 97][col - 1] = actual == playerA ? "X" : "O"
        break
      end
    end
  end

  def announcement(actual)
    text = "#{actual.name} wins." if board.wins?
    text = "It's a draw." unless board.wins?
    print_game(text)
    puts
  end

  def ended?
    board.full? || board.wins?
  end

end

b = Board.new
Board.clear
print "What is the name of the first player? "
pA = Player.new(gets.chomp)
puts
print "What is the name of the second player? "
pB = Player.new(gets.chomp)
puts
g = Game.new(b, pA, pB)
g.play
