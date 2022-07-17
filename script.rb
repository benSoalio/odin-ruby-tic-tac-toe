# Create player class
class Player
  attr_accessor :name, :sign, :positions

  def initialize(name, sign)
    @name = name
    @sign = sign
    @positions = []
  end
end

# Game Class
class Game

  
  def initialize

    # Take the players name and sign
    puts "Enter your name player 1: "
    name = gets.chomp

    puts "Enter your sign player 1:"
    sign = gets.chomp 

    @player_one = Player.new(name, sign)

    puts "Enter your name player 2: "
    name = gets.chomp

    puts "Enter your sign player 2:"
    sign = gets.chomp 

    @player_two = Player.new(name, sign)

    # Variable to keep track ot player turn 
    @turn = true
  end
  
  def play
    @current_player = @turn ? @player_one : @player_two
  
    # To keep track of the position already occupied
    @positions = @player_one.positions.concat(@player_two.positions)
    puts "positions #{@positions}"
    @current_position = 0
    puts " conditions include #{@positions.include?(@current_position)}"

    # Repeat until the position of the player is from 1 to 9 and not already used
    until @current_position > 0 && @current_position < 10
      puts "#{@current_player.name} choose your position: "
      @current_position = gets.chomp.to_i
      puts "player positions array #{@current_player.positions}"
    end

    @current_player.positions.push(@current_position)
    puts " current position #{@current_position}"
    # Check if there is a winner 
    @turn = !@turn
  end
  
  
end

def main
  game = Game.new
  game.play
end

main

# Show the board

# Take player moov

# Check if there is a winning combination

# Publish the winner

# Start the game
# def game
#   # Take player input and create player
#   while Player.numberofplayers < 2
#     puts "Enter your name player #{Player.numberofplayers + 1}"
#     name = gets.chomp

#     puts "Enter your sign player #{Player.numberofplayers + 1}"
#     sign = gets.chomp 

#     if Player.numberofplayers == 0
#       player_one = Player.new(name, sign)
#     else
#       player_two = Player.new(name, sign)
#     end
#   end

#   # puts player_one.name
#   # puts player_two.name
#   # puts player_one.sign
#   # puts player_two.sign

#   # Repeat there is no winner or no tie
#   is_winner = false

#   # To keep track of the player turn
#   player_turn = player_one
 
#   # Number of plays
#   number_of_plays = 0

#   # Display the board

#   until is_winner || number_of_plays >= 9
#     position_is_free = false
    
#     until position_is_free
#       puts "#{player_turn.name} your turn, chosse your position"
#       position = gets.chomp.to_i
#     end

#     # Check if the position is available
#     position_is_free = player_turn.positions.include?(position)
    
#     # Update player positions array
#     player_turn.positions.push(position) 

#     # update the board
#     # DisplayBoard

#     # Check if there is a winning combination

#     puts "#{player_turn.positions} "
   
#     # Update the number of plays
#     number_of_plays += 1
#     result = number_of_plays == 9 ? "it is a tie" : ""
#     # Change player_turn
#     player_turn = player_turn == player_one ? player_two : player_one
#   end 

#   puts result
# end

