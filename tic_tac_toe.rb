class User
  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end


end

class Board
  def initialize
    @board = [
                ['--1--', '--2--', '--3--'],
                ['--4--', '--5--', '--6--'],
                ['--7--', '--8--', '--9--']
              ]
  end

  def draw_board
    @board.each do |row|
      print "|"
      row.each { |cell| print "#{cell}" }
      puts "|\n"
  end
end

class Game < Board
  def initialize
    @player_one = ''
    @player_two = ''
    game_loop()
  end

  def game_loop
    while true
      puts "Player one, enter a name: "
      name = gets.chomp
      @player_one = User.new(name, "X")
      puts "Player one has been assigned 'X'"
      puts "Player two, enter a name: "
      name = gets.chomp
      @player_two = User.new(name, "O")
      puts "Player two has been assigned 'O'"
  end
end