# Second attept to Hangman
# more structured

# setup
lives = 10
guess_arr = []
won = false
SECRET = 'ball'


puts 'Normal Hangman rules'
puts 'You have 10 lives to guess the word'
puts 'Every Worng guess you will lose a life'
puts 'Here we go'


  while lives >= 0 
    puts 'guess a letter'
    guess = gets.chomp
    if SECRET.include? guess
      puts guess
    else
      puts 'guess another letter'
      puts "you have #{lives} lives left"
      lives -= 1
    end
  end
