require "./player.rb"
require "./question.rb"

class Game
  attr_accessor :lives

  turnNum = 0

  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "Hello and welcome to the math game!"
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n "

  # random number to see who goes first
  coinToss = rand(0..1)
  puts "Tossing the coin to see who goes first..."
  sleep 2
  if (coinToss == 0)
    puts "\nPlayer 1 won the coin toss! They will go first.\n "
    player1 = Player.new(true)
    player2 = Player.new(false)
  else
    puts "\nPlayer 1 won the coin toss! They will go first.\n "
    player1 = Player.new(false)
    player2 = Player.new(true)
  end
  sleep 2

  while (player1.alive? && player2.alive?) do
    #turn counter
    turnNum +=1
    puts "----------TURN #{turnNum}----------"

    #player 1 turn
    if (player1.currentTurn?)
      question = Question.new()
      puts "P1: #{question.math_question}"
      if (question.correctAnswer == user_answer)
        puts 'YES! You are correct.'
        puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
        player1.turn = false
        player2.turn = true
      else
        puts "Seriously? NO!"
        player1.lives -= 1
        puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
        player1.turn = false
        player2.turn = true
      end
      
    #player 2 turn
    else (player2.currentTurn?)
        question = Question.new()
        puts "P2: #{question.math_question}"
        puts question.correctAnswer
        user_answer = gets.chomp.to_i
        if (question.correctAnswer == user_answer)
          puts 'YES! You are correct.'
          puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
          player1.turn = true
          player2.turn = false
        else
          puts "Seriously? NO!"
          player2.lives -= 1
          puts "P1: #{player1.lives}/3 vs P2: #{player2.lives}/3"
          player1.turn = true
          player2.turn = false
        end
      end
  end
  
  #game over - announce winner and loser
  puts "~~~~~~~~~~~~~~~~~~GAME OVER~~~~~~~~~~~~~~~~~~~~"
  if (player1.lives == 0)
    puts "PLAYER 2 WINS!!!!!"
    puts "Final Score: #{player1.lives}/3 vs P2: #{player2.lives}/3"
    puts "Goodbye!"
  else
    puts "PLAYER 1 WINS!!!!!"
    puts "Final Score: #{player1.lives}/3 vs P2: #{player2.lives}/3"
    puts "Goodbye!"
  end
end
