def rollDice
  sides = ["n","g","h","s"]

  #roll dice and act
  roll = rand(0..3)
  puts "\nYou rolled '#{sides[roll]}'\n\n"

  case sides[roll]
    when "n"
      puts  "Nun. No action required\n\n"
    when "g"
      puts "Gimmel. You win the pot containing #{@pot} token(s). We can't have an empty pot, so we put a token in the pot.\n\n"
      @currentplayertokens += @pot
      @pot = 0
      @currentplayertokens -= 1 #replenish the pot with a token
      @pot += 1
    when "h"
      puts "Hay. You win half the pot. If the pot has an odd number, you win half + 1\n\n"
      if @pot % 2 > 0
        @currentplayertokens += (@pot/2)+1
        puts "You win #{(@pot/2)+1} token(s)"
        @pot -= (@pot/2)+1
      else
        @currentplayertokens += @pot/2
        puts "You win #{@pot/2} token(s)"
        @pot -= @pot/2
      end
    when "s"
      puts "Shin. Put a token into the pot\n\n"
      @currentplayertokens -= 1
      @pot += 1
  end
  #return @currentplayertokens
end


# setup game
tokens = 20 # must be an even number
player1tokens = tokens/2
player2tokens = tokens/2
@pot = 0
rounds = 0

puts "Player 1's current tokens: #{player1tokens}"
puts "Player 2's current tokens: #{player2tokens}"
puts "In the pot: #{@pot}\n\n"

# who is the current player
player1turn = true

while (player1tokens > 0 || player2tokens > 0)  #if either player has at least 1 token

	if player1turn == true
    rounds += 1
    #currentplayer = 1
    @currentplayertokens = player1tokens
		puts "---------------------\nPlayer 1's turn\n\n"

    puts "You put 1 token in the pot to access play\n\n"
	  @pot += 1 # put a token in the pot. Pay to play.
	  @currentplayertokens -= 1 # pay to play

	  puts "You have #{@currentplayertokens} token(s) left\n\n"

	  if @pot == 1
	  	puts "There is now 1 token in the pot\n\n"
	  else
	  	puts "There are now #{@pot} tokens in the pot\n\n"
	  end

    # roll the dice
    rollDice

    # check if player has any tokens left. If not, end the game.
	  if @currentplayertokens <= 0
	    puts "Sorry, you have no tokens left, you lost the game. Player 2 WINS!!!"
      puts "\nThis game took #{rounds} rounds"
      break # end the WHILE loop
	  end

    #dump the current token tally to the current player 
    player1tokens = @currentplayertokens

    # switch player at the end of your turn
    player1turn = !player1turn

	  puts "\n\n***END OF PLAYER 1'S TURN***\n\n"
	  puts "Player 1's current total: #{player1tokens}"
	  puts "Player 2's current total: #{player2tokens}"
	  puts "In the pot: #{@pot}\n\n"

  end

  # action player2#s turn
	if player1turn == false
    @currentplayertokens = player2tokens
	  puts "---------------------\nPlayer 2's turn\n\n"

    puts "You put 1 token in the pot to access play\n\n"
	  @pot += 1 # put a token in the pot. Pay to play.
	  @currentplayertokens -= 1 # pay to play

	  puts "You have #{@currentplayertokens} token(s) left\n\n"

	  if @pot == 1
	  	puts "There is now 1 token in the pot\n\n"
	  else
	  	puts "There are now #{@pot} tokens in the pot\n\n"
	  end

    # roll the dice
    rollDice

	  # check if player has any tokens left. If not, end the game.
	  if @currentplayertokens <= 0
      puts "Sorry, you have no tokens left, you lost the game. Player 1 WINS!!!"
      puts "\nThis game took #{rounds} rounds"
      break # end the WHILE loop
    end

    #dump the current token tally to the current player
    player2tokens = @currentplayertokens

    # switch player at the end of your turn
    player1turn = !player1turn

    puts "\n\n***END OF PLAYER 2'S TURN***\n\n"
    puts "Player 1's current total: #{player1tokens}"
    puts "Player 2's current total: #{player2tokens}"
    puts "In the pot: #{@pot}\n\n"

	end
end