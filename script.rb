#Create player class
class Player
    attr_accessor :name
    attr_accessor :sign
    attr_accessor :positions

    @@players_count = 0

    def initialize(name, sign)
      @name = name
      @sign = sign
      @positions = []
      
      @@players_count += 1
    end

    def self.numberofplayers
        return @@players_count
    end
end


#Take player input and create player
while Player.numberofplayers < 2 do
  puts "Enter your name player #{Player.numberofplayers + 1}"
  name = gets.chomp

  puts "Enter your sign player #{Player.numberofplayers + 1}"
  sign = gets.chomp 

  if Player.numberofplayers == 0
    player_one = Player.new(name, sign)
  else
    player_two = Player.new(name, sign)
  end
end



puts player_one.name
puts player_two.name
puts player_one.sign
puts player_two.sign

#Start the game
  #repeat there is winning combination
  #Show the board

  #Take player moov

  #Check if there is a winning combination

#Publish the winner