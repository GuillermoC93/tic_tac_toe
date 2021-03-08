class User
  attr_reader :name, :symbl

  def initialize(name, symbl)
    @name = name
    @symbl = symbl
  end
end

class Board
  attr_reader :board
  attr_writer :moves

  def initialize
    @board = [
                  ['--1--', '--2--', '--3--'],
                  ['--4--', '--5--', '--6--'],
                  ['--7--', '--8--', '--9--']
              ]

    @moves = []
  end

  def draw_board
    @board.each do |row|
      print '|'
      row.each { |cell| print "#{cell}" }
      puts "|\n"
    end
    print "\n\n"
  end

  def update_board(player, move)
    if move < 1 || move > 9
      puts 'Error! Not a valid move'
      puts 'Please input a valid move: '
      move = gets.chomp.to_i until move >= 1 && move < 10
    end
    if @moves.include?(move)
      puts 'Error! Not a valid move'
      puts 'Please input a valid move: '
      move = gets.chomp.to_i until @moves.include?(move) == false
    end
  
    if (1..3).include?(move)
      @moves << move
      @board[0][move-1][2] = "#{player.symbl}" 
    elsif (4..6).include?(move)
      @moves << move
      @board[1][move-4][2] = "#{player.symbl}"
    else
      @moves << move
      @board[2][move-7][2] = "#{player.symbl}"
    end
    draw_board
  end

  def horizontal_win
    if @board[0][0][2] == 'X' && @board[0][1][2] == 'X' && @board[0][2][2] == 'X'
      puts "#{@player_one.name} has won the game!"
      new_game?
    elsif @board[1][0][2] == 'X' && @board[1][1][2] == 'X' && @board[1][2][2] == 'X'
      puts "#{@player_one.name} has won the game!"
      new_game?
    elsif @board[2][0][2] == 'X' && @board[2][1][2] == 'X' && @board[2][2][2] == 'X'
      puts "#{@player_one.name} has won the game!"
      new_game?
    elsif @board[0][0][2] == 'O' && @board[0][1][2] == 'O' && @board[0][2][2] == 'O'
      puts "#{@player_two.name} has won the game!"
      new_game?
    elsif @board[1][0][2] == 'O' && @board[1][1][2] == 'O' && @board[1][2][2] == 'O'
      puts "#{@player_two.name} has won the game!"
      new_game?
    elsif @board[2][0][2] == 'O' && @board[2][1][2] == 'O' && @board[2][2][2] == 'O'
      puts "#{@player_two.name} has won the game!"
      new_game?
    end
  end

  def vertical_win
    if @board[0][0][2] == 'X' && @board[1][0][2] == 'X' && @board[2][0][2] == 'X'
      puts "#{@player_one.name} has won the game!"
      new_game?
    elsif @board[0][1][2] == 'X' && @board[1][1][2] == 'X' && @board[2][1][2] == 'X'
      puts "#{@player_one.name} has won the game!"
      new_game?
    elsif @board[0][2][2] == 'X' && @board[1][2][2] == 'X' && @board[2][2][2] == 'X'
      puts "#{@player_one.name} has won the game!"
      new_game?
    elsif @board[0][0][2] == 'O' && @board[1][0][2] == 'O' && @board[2][0][2] == 'O'
      puts "#{@player_two.name} has won the game!"
      new_game?
    elsif @board[0][1][2] == 'O' && @board[1][1][2] == 'O' && @board[2][1][2] == 'O'
      puts "#{@player_two.name} has won the game!"
      new_game?
    elsif @board[0][2][2] == 'O' && @board[1][2][2] == 'O' && @board[2][2][2] == 'O'
      puts "#{@player_two.name} has won the game!"
      new_game?
    end
  end

  def diagonal_win
    if @board[0][0][2] == 'X' && @board[1][1][2] == 'X' && @board[2][2][2] == 'X'
      puts "#{@player_one.name} has won the game!"
      new_game?
    elsif @board[2][0][2] == 'X' && @board[1][1][2] == 'X' && @board[0][2][2] == 'X'
      puts "#{@player_one.name} has won the game!"
      new_game?
    elsif @board[0][0][2] == 'O' && @board[1][1][2] == 'O' && @board[2][2][2] == 'O'
      puts "#{@player_two.name} has won the game!"
      new_game?
    elsif @board[2][0][2] == 'O' && @board[1][1][2] == 'O' && @board[0][2][2] == 'O'
      puts "#{@player_two.name} has won the game!"
      new_game?
    end
  end
end

class Game < Board
  attr_reader :player_one, :player_two

  def initialize
    super
    start_game
    game_loop
  end

  def start_game
    player_one_name
    player_two_name
    draw_board
  end

  def player_one_name
    puts 'Player one, enter a name: '
    name = gets.chomp
    @player_one = User.new(name, 'X')
    puts "#{@player_one.name} has been assigned 'X'"
    print "\n"
  end

  def player_two_name
    puts 'Player two, enter a name: '
    name = gets.chomp
    @player_two = User.new(name, 'O')
    puts "#{@player_two.name} has been assigned 'O'"
    print "\n\n"
  end

  def player_one_move
    puts "#{@player_one.name} please input a number for your move: "
    @player_one_move = gets.chomp.to_i
    print "\n\n"
  end

  def player_two_move
    puts "#{@player_two.name} please input a number for your move: "
    @player_two_move = gets.chomp.to_i
    print "\n\n"
  end

  def player_one_win?
    horizontal_win
    vertical_win
    diagonal_win
  end

  def player_two_win?
    horizontal_win
    vertical_win
    diagonal_win
  end

  def tie_game
    puts "It's a tie!"
  end

  def new_game?
    puts "New game? [y/n]"
    answer = gets.chomp
    if answer == "y"
      true
    else
      false
    end
  end

  def game_loop
    loop do
      player_one_move
      update_board(@player_one, @player_one_move)
      player_two_move
      update_board(@player_two, @player_two_move)
      player_one_move
      update_board(@player_one, @player_one_move)
      player_two_move
      update_board(@player_two, @player_two_move)
      player_one_move
      update_board(@player_one, @player_one_move)
      player_one_win?
      player_two_move
      update_board(@player_two, @player_two_move)
      player_two_win?
      player_one_move
      update_board(@player_one, @player_one_move)
      player_one_win?
      player_two_move
      update_board(@player_two, @player_two_move)
      player_two_win?
      player_one_move
      update_board(@player_one, @player_one_move)
      player_one_win?
      tie_game
      break
    end
  end
end