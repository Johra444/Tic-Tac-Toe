require "color_text"
require_relative "lib/board" # Link the different classes files
require_relative "lib/board_case" # Link the different classes files
require_relative "lib/game" # Link the different classes files
require_relative "lib/player" # Link the different classes files

game = Game.new # Start new game!
game.go #Starting the game.
