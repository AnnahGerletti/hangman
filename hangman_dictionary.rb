
# Dictionary::SECRET # => blueprint
# @dictionary = Dictionary.new # => house
class Dictionary
  attr_reader :word
  SECRET = ['watermelon', 'orange', 'apple', 'kiwi', 'grape']

  def initialize
    @random_word = SECRET.sample.chars
  end
end