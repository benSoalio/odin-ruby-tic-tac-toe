# Create player class
class Player
  attr_accessor :name, :sign, :positions

  def initialize(name, sign)
    @name = name
    @sign = sign
    @positions = []
  end
end