class Player 

  attr_accessor :lives, :turn

  def initialize(lives = 3, turn)
    @lives = lives
    @turn = turn
  end

  def alive?
    @lives > 0
  end

  def currentTurn?
    @turn
  end

  def turnOver
    @turn = false
  end
end