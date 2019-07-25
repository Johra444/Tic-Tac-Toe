class Game
  @@victory = false #class variable to break the loop when needed.

  def initialize # Starting the game with good looking emojis
    puts "\n      |      |              |      |              |      |        "
    puts "  🔵  |  ❌  |  ❌      🔵  |  🔵  |  ❌      ❌  |  ❌  |  ❌    "
    puts "______|______|______  ______|______|______  ______|______|______  "
    puts "      |      |              |      |              |      |        "
    puts "  🔵  |  🔵  |  ❌      ❌  |  🔵  |  ❌      🔵  |  🔵  |  ❌    "
    puts "______|______|______  ______|______|______  ______|______|______  "
    puts "      |      |              |      |              |      |        "
    puts "  ❌  |      |  🔵      ❌  |  ❌  |  ❌      ❌  |  🔵  |  🔵    "
    puts "      |      |              |      |              |      |        "
    puts "\n\n\t\t🎮⚙️  Welcome to Tic Tac Toe ⚙️ 🎮"
    @p_one = Player.new
    @p_one.infos
    @p_two = Player.new
    @p_two.infos
    @board_game = Board.new
  end

  def go # Game playing method
    system "clear"
    i = 0
    loop do
      break if i > 8
      self.turn(@p_one)
      i += 1
      if @@victory
        puts "\t 🏁 We found a winner! 🎉 🎉"
        @board_game.show
        puts "\nWe have a winner! 🏆"
        puts "Congrats #{@p_one.pname}! You won! 👏"
        break
      end
      break if i > 8
      self.turn(@p_two)
      i += 1
      if @@victory
        puts "\t 🏁 We found a winner! 🎉 🎉"
        @board_game.show
        puts "\nWe have a winner! 🏆"
        puts "Congrats #{@p_two.pname}! You won! 👏"
        break
      end
    end
    if @@victory == false
      @board_game.show
      puts "It's a draw! Think outside the box next time! 🤔"
    end
    puts "\n#{@p_one.pname} : #{@p_one.ppoints} ⚔️ versus⚔️  #{@p_two.pname} : #{@p_two.ppoints}"
    puts "Want to do another game versus that opponent ? (expecting Y or N)"
    choice = gets.chomp.capitalize
    if choice == "Y"
      @@victory = false
      @board_game = Board.new
      self.go
    end
  end

  def turn(player) #setting the order in which players are gonna play the game.
    @choice = 0
    puts "\t#{@p_one.pname} plays as #{@p_one.pmark}, #{@p_two.pname} plays as #{@p_two.pmark}! Play smart! 🤔 🤔"
    @board_game.show
    puts "It's #{player.pname}'s turn!"
    puts "Where do you want to place your next move (on the grid from 1 to 9)"
    print "\t> "
    while !((1..9).include?(@choice))
      @choice = gets.chomp.to_i
    end
    @board_game.get_player_choice(@choice, player.pmark, player)
    system "clear"
    if @board_game.victory(player)
      @@victory = true
      player.ppoints += 1
    end
  end
end
