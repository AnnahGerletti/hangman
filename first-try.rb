SECRET = 'dog'.chars #the chars method breaks up string into arr of strings

def ask_player
    answer = gets.chomp
    if answer == "yes" 
        puts "Lets Play!"
        return true
    else 
        puts "whatever"
        return false
    end
end


# until answer do - does the same thing as the above loop

def run 
    answer = false 
    while !answer do 
         puts 'Do you want to play Hangman, yes or no'
        answer = ask_player
    end
end

run # calling the run method, incased the second answer variable 

# need to compare the guess to secret
# get some guesses, then print them out added new guess on old printed guess

def make_a_guess
    puts 'please guess a letter'
    guess = gets.chomp
    puts 'this your guess - ' + guess
    puts "this is also your guess #{guess}"
    return guess
end

winning = false
guess_arr = []

until winning do 
    guess = make_a_guess
    guess_arr.push(guess)
    print guess_arr

end