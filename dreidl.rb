# set up global variables
player1turn = true
tokens = 6 # must be an even number. Set low initially so we can evaluate results.
sides = ["n","g","h","s"]

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
    roll = rand(0..3)
    puts "\nYou rolled '#{sides[roll]}'\n\n"

    # determine roll outcomes
    case sides[roll]
      # roll N (nun): do nothing
      when "n"
        puts  "Nun. No action required\n\n"
      # roll G (gimmel): take the pot
      when "g"
        puts "Gimmel. You win the pot of #{pot} tokens\n\n"
        player1tokens += pot
        pot = 0
      # roll H (hay): get half the pot/kitty. If the pot has an odd number, you win half + 1 tokens
      when "h"
        if pot % 2 > 0
          puts "Hay. You win half the pot, so you win #{(pot/2)+1} token(s)\n\n"
          player1tokens += (pot/2)+1
          pot -= (pot/2)+1
        else
          puts "Hay. You win half the pot, so you win #{pot/2} token(s)\n\n"
          player1tokens += pot/2
          pot -= pot/2
        end
      # roll S (shin): put a token in the kitty
      when "s"
        puts "Shin. Put a token into the pot\n\n"
        player1tokens -= 1
        pot += 1
    end

    # determine if player lost
    if player1tokens <=0
      puts "Oy vey! You are out of tokens. YOU LOSE. ***Player 2 wins!***"
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
    roll = rand(0..3)
    puts "\nYou rolled '#{sides[roll]}'\n\n"
    
    # determine roll outcomes
    case sides[roll]
      # roll N (nun): do nothing
      when "n"
        puts  "Nun. No action required\n\n"
      # roll G (gimmel): take the pot
      when "g"
        puts "Gimmel. You win the pot of #{pot} tokens\n\n"
        player2tokens += pot
        pot = 0
      # roll H (hay): get half the pot/kitty. If the pot has an odd number, you win half + 1 tokens
      when "h"
        if pot % 2 > 0
          puts "Hay. You win half the pot, so you win #{(pot/2)+1} token(s)\n\n"
          player2tokens += (pot/2)+1
          pot -= (pot/2)+1
        else
          puts "Hay. You win half the pot, so you win #{pot/2} token(s)\n\n"
          player2tokens += pot/2
          pot -= pot/2
        end
      # roll S (shin): put a token in the kitty
      when "s"
        puts "Shin. Put a token into the pot\n\n"
        player2tokens -= 1
        pot += 1
    end

    # determine if player lost
    if player2tokens <=0
      puts "Oy vey! You are out of tokens. YOU LOSE. ***Player 1 wins!***"
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