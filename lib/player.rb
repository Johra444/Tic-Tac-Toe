class Player

    @@player = 0 # Define the number of players, used to attrib symbols.
    @@mark = ""
    
      attr_accessor :pname, :pmark, :ppoints
    
      def initialize #Adding a player and resetting scoreboard.
        @pname = ""
        @pmark = ""
        @@player += 1
        @ppoints = 0
      end
    
      def infos #Setting a more personnalized environment
        puts "\n➡️➡️   Player, give us your alias/name: "
        print "\t> "
        @pname = ((gets.chomp).to_s).capitalize
        if @@player == 1 && @@mark == ""
          puts "\nWhat symbol do you want to play with ? ❌ or 🔵 (expecting X or O as input)"
          while @pmark != "X" && @pmark != "O" do
             @pmark = (gets.chomp).to_s.capitalize
          end
        elsif @@mark == "X" #Second player doesn't pick his symbol, automatically set here.
          @pmark = "O"
        elsif @@mark == "O"
          @pmark = "X"
        end
        @@mark = @pmark
        puts "#{@pname} will play as #{@pmark}!" #Displaying the symbols players will play with.
      end
    end