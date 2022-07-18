
require './player.rb'
require './board.rb'
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