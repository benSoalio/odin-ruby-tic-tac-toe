require './game.rb'

def main

  replay = "y"
  while replay == "y"
    game = Game.new
    until game.is_winner 
      game.play 
      game.play_count += 1
      if game.play_count == 9
        puts "It is a tie game" unless game.is_winner
        break
      end
    end
    puts "press 'y' or 'Y' for another game"
    replay = gets.chomp.downcase
  end
end

main
