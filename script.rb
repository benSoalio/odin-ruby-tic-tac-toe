# Create player class
class Player
  attr_accessor :name, :sign, :positions

  def initialize(name, sign)
    @name = name
    @sign = sign
    @positions = []
  end
end

# Board class
class Board

  
  def initialize
    @cell = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  
  def show 
    puts "
    #{@cell[0]} | #{@cell[1]} | #{@cell[2]}
    ---------
    #{@cell[3]} | #{@cell[4]} | #{@cell[5]}
    ---------
    #{@cell[6]} | #{@cell[7]} | #{@cell[8]}
    "
  end

  def update (position, sign)
    @cell[position - 1] = sign
  end

end

# Game Class
class Game
  WINNING_COMBO = [[1, 2, 3], [1, 4, 7], [1, 5, 9], [4, 5, 6], [2, 5, 8], [3, 5, 7], [7, 8, 9], [3, 6, 9]]
  
  attr_accessor :is_winner, :play_count

  def initialize

    # Take the players name and sign
    puts "Enter your name player 1: "
    name = gets.chomp
    sign = "O" 

    @player_one = Player.new(name, sign)

    puts "Enter your name player 2: "
    name = gets.chomp
    sign = "X" 

    @player_two = Player.new(name, sign)

    # Show the Board
    @board = Board.new
    @board.show

    # Variable to keep track ot player turn 
    @turn = true

    # Variable to keep track of a winner
    @is_winner = false

    # Variable to keep track number of plays
    @play_count = 0


  end

  def play

    # Update the player turn 
    @current_player = @turn ? @player_one : @player_two

    # Keep track of th position played
    @position_played = 0

    # Repeat until the position played is within 1 to 9
    until @position_played.positive? && @position_played < 10
      # Ask the player to choose a position 
      puts "Choose your position between 1 and 9"
      puts "#{@current_player.name} choose your position: "
      @position_played = gets.chomp.to_i

      # Check if the posotion played is free
      if @player_one.positions.include?(@position_played)
        puts "#{@player_one.name} already played in this position"
        # Reset position played
        @position_played = 0
      elsif @player_two.positions.include?(@position_played)
        puts "#{@player_two.name} already played in this position"
        # Reset position played
        @position_played = 0
      else
        # Update the player positions array
        @current_player.positions.push(@position_played) unless @position_played.zero? || @position_played == 10
      end
    end
    
    # Update board
    @board.update(@current_player.positions[-1], @current_player.sign)

    # Show the board
    @board.show
    
    # Update is_winner 
    winner?(@current_player.name, @current_player.positions)
    
    # Change the player turn
    @turn = !@turn
  end 

  def winner?(name, positions)
    positions.combination(3) do |combo|
      combo.sort!
      if WINNING_COMBO.include?(combo)
        @is_winner = true
        puts "#{name} wins the game"
        break
      end
    end
  end
end

def main
  game = Game.new
  until game.is_winner 
    game.play 
    game.play_count += 1
    if game.play_count == 9
      puts "It is a tie game" unless game.is_winner
      break
    end
  end
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

# def play

#     # is_winner = 0

#     # To keep track of the position already occupied
#     @positions = []
#     @current_position = 0

#     # until is_winner > 9

#       @current_player = @turn ? @player_one : @player_two
    
      
#       # puts "positions #{@positions}"
      
#       puts " conditions include #{@positions.include?(@current_position)}"
  
#       # Repeat until the position of the player is from 1 to 9 and not already used
#       until @current_position > 0 && @current_position < 10
#         puts "#{@current_player.name} choose your position: "
#         @current_position = gets.chomp.to_i
#         @current_player.positions.push(@current_position) unless @positions.include?(@current_position)
#         @positions.push(@current_position) unless @positions.include?(@current_position)
#         puts "player positions array #{@current_player.positions}"
#       end
      
#       puts "positions #{@positions}"
#       # Check if there is a winner 
#       @turn = !@turn
#       # is_winner += 1
#     # end
#   end