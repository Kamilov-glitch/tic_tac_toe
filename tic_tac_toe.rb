require 'pry'

class Player
  attr_reader :name
  @@playground = {
    1 => " ",
    2 => " ",
    3 => " ",
    4 => " ",
    5 => " ",
    6 => " ",
    7 => " ",
    8 => " ",
    9 => " "
  }

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
    puts " "
    #playground
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
    puts " "
  end
  
  def playground
    p @@playground
  end

  def self.winning_condition(name)
    if @@playground[1] == 'X' && @@playground[4] == 'X' && @@playground[7] == 'X' || @@playground[1] == 'O' && @@playground[4] == 'O' && @@playground[7] == 'O'
      puts "You win #{name}. Congratulatiions!"
    elsif @@playground[2] == 'X' && @@playground[5] == 'X' && @@playground[8] == 'X'
      puts "You win #{name}. Congratulatiions!"
    elsif @@playground[3] == 'X' && @@playground[6] == 'X' && @@playground[9] == 'X'
      puts "You win #{name}. Congratulatiions!"
    elsif @@playground[1] == 'X' && @@playground[5] == 'X' && @@playground[9] == 'X'
      puts "You win #{name}. Congratulatiions!"
    elsif @@playground[1] == 'X' && @@playground[2] == 'X' && @@playground[3] == 'X'
      puts "You win #{name}. Congratulatiions!"
    elsif @@playground[4] == 'X' && @@playground[5] == 'X' && @@playground[6] == 'X'
      puts "You win #{name}. Congratulatiions!"
    elsif @@playground[7] == 'X' && @@playground[8] == 'X' && @@playground[9] == 'X'
      puts "You win #{}. Congratulatiions!"
    elsif @@playground[3] == 'X' && @@playground[5] == 'X' && @@playground[7] == 'X'
      puts "You win #{name}. Congratulatiions!"
    elsif @@playground.has_value?(' ') == false
      puts "Well boys it's a draw, you useless, lowlife, good-for-nothing bunch of dissapointments!"
    end
  end

end

class PlayerOne < Player
  def choice
    super
    if @@playground[@choice] == " "
      @@playground[@choice] = 'X'
    else
      puts "You have to choose empty positions!"
      choice
    end
  end
end

class PlayerTwo < Player
  def choice
    super
    if @@playground[@choice] == " "
      @@playground[@choice] = 'O'
    else
      puts "You have to choose empty positions!"
      choice
    end
  end
end

Player.print_playground

puts "Player one : What's your name?"
player_one = PlayerOne.new(gets.chomp)
puts "Player two : What's your name?"
player_two = PlayerTwo.new(gets.chomp)

puts "#{player_one.name}'s turn"
# binding.pry
player_one.choice
Player.print_playground
Player.winning_condition(player_one.name)

puts "#{player_two.name}'s turn"
player_two.choice
Player.print_playground
Player.winning_condition(player_two.name)