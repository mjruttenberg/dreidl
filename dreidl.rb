# set up global variables
player1turn = true
tokens = 6 # must be an even number. Set low initially so we can evaluate results.

#assumes numberOfPlayers = 2
player1tokens = tokens/2 
player2tokens = tokens/2
pot = 0 # establish the kitty

puts "Player 1's current tokens: #{player1tokens}"
puts "Player 2's current tokens: #{player2tokens}"
puts "In the pot: #{pot}\n\n"


# loop through the players
while player1tokens > 0 and player1tokens> 0
  if player1turn == true
    puts "---------------------\nPlayer 1's turn\n\n"

    puts "You put 1 token in the pot to access play\n\n"
    pot += 1 # put a token in the pot. Pay to play.
    player1tokens -= 1 # pay to play

    # roll dice contraining 4 faces: N, G, H, S
      # roll N (nun): do nothing
      # roll G (gimmel): take the pot
      # roll H (hay): get half the pot/kitty
      # roll S (shin): put a token in the kitty

    # determine result
      # determine if player lost

    player1tokens -=1
    puts "Player 1 tokens left = #{player1tokens}"
    if player1tokens <=0
      puts "You are out of tokens. You lose. Player 2 wins"
      break # end the while loop
    end


    puts "\n\n***END OF PLAYER 1'S TURN***\n\n"
    puts "Player 1's current total: #{player1tokens}"
    puts "Player 2's current total: #{player2tokens}"
    puts "In the pot: #{pot}\n\n"

    # switch player
    player1turn = !player1turn

  else
    puts "---------------------\nPlayer 2's turn\n\n"

    # roll dice contraining 4 faces: N, G, H, S
      # roll N (nun): do nothing
      # roll G (gimmel): take the pot
      # roll H (hay): get half the pot/kitty
      # roll S (shin): put a token in the kitty

    # determine result
      # determine if player lost
    
    puts "Player 2 tokens left = #{player2tokens}"
    if player2tokens <=0
      puts "You are out of tokens. You lose. Player 1 wins"
      break # end the while loop
    end

    puts "\n\n***END OF PLAYER 2'S TURN***\n\n"
    puts "Player 1's current total: #{player1tokens}"
    puts "Player 2's current total: #{player2tokens}"
    puts "In the pot: #{pot}\n\n"

    # switch player
    player1turn = !player1turn
  end

end