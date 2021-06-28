class Player
  attr_reader :name
  @@playground = Hash.new

  def self.print_and_flush(str)
    print str
    $stdout.flush
  end

  def self.playground
    for i in 1..9
      @@playground[i] = " "
    end
  end

  def initialize(name)
    @name = name
  end

  def choice
    @choice = gets.chomp.to_i
  end

  def self.print_playground
    playground
    r = 0
    @@playground.each do |key, value|
      if r < 2
        print_and_flush(value + "|")
        r += 1
      else
        puts value
        puts "------" unless key == 9
        r = 0
      end
    end
  end       
end

class PlayerOne < Player
end

class PlayerTwo < Player
end

Player.print_playground

# puts "Player one : What's your name?"
# player_one = Player.new(gets.chomp)
# puts "Player two : What's your name?"
# player_two = Player.new(gets.chomp)