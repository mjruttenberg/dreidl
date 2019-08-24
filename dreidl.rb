# set up global variables
player1turn = true
tokens = 6 # must be an even number. Set low initially so we can evaluate results.

#assumes numberOfPlayers = 2
player1tokens = tokens/2 
player2tokens = tokens/2
pot = 0 # establish the kitty

# loop through the players
while player1tokens > 0 and player1tokens> 0
  if player1turn == true
    puts "player 1's turn"

    # roll dice contraining 4 faces: N, G, H, S
      # roll N (nun): do nothing
      # roll G (gimmel): take the pot
      # roll H (hay): get half the pot/kitty
      # roll S (shin): out a token in the kitty

    # determine result
      # determine if player lost

    tokens -=1
    puts "Player 1 tokens left = #{tokens}"
    if tokens <=0
      puts "You are out of tokens. You lose. Player 2 wins"
      break # end the while loop
    end


    # switch player
    player1turn = !player1turn

  else
    puts "player 2's turn"
    currentplayer = "player 2"

    # roll dice

    # determine result
      # determine if player lost
    
    puts "Player 2 tokens left = #{tokens}"
    if tokens <=0
      puts "You are out of tokens. You lose. Player 1 wins"
      break # end the while loop
    end

    # switch player
    player1turn = !player1turn
  end

end