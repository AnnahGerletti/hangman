

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

answer = false 
while !answer do 
     puts "Do you want to play Hangman, yes or no"
    answer = ask_player
end
