class Player

  attr_accessor :wins, :losses
  attr_reader :name

  @@player_counter = 1

  def initialize(name = "Player#{@@player_counter}")
    @name = name
    @wins = 0
    @losses = 0
    @@player_counter += 1
  end

end
