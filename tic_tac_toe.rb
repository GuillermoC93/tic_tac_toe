class User
  attr_reader :name

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end

class Board
  attr_reader :board

  def initialize
    @board =  [
                  ['--1--', '--2--', '--3--'],
                  ['--4--', '--5--', '--6--'],
                  ['--7--', '--8--', '--9--']
              ]
  end

  def draw_board
    @board.each do |row|
      print '|'
      row.each { |cell| print "#{cell}" }
      puts "|\n"
    end
  end
end

class Game < Board
  attr_reader :player_one, :player_two

  def initialize
    super
    game_loop
  end

  def player_one_name
    puts 'Player one, enter a name: '
    name = gets.chomp
    @player_one = User.new(name, 'X')
    puts "Player one has been assigned 'X'"
  end

  def player_two_name
    puts 'Player two, enter a name: '
    name = gets.chomp
    @player_two = User.new(name, 'O')
    puts "Player two has been assigned 'O'"
    print "\n\n"
  end

  def player_one_move
    puts "#{@player_one.name} please input a number for your move: "
    @player_one_move = gets.chomp
  end

  def player_two_move
    puts "#{@player_two.name} please input a number for your move: "
    @player_two_move = gets.chomp
  end
  
  def game_loop
    loop do
      player_one_name
      player_two_name
      draw_board
      print "\n\n"
      player_one_move
    end
  end
end