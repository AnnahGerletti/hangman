
# Dictionary::SECRET # => blueprint
# @dictionary = Dictionary.new # => house
class Dictionary
  attr_reader :secret
  SECRET = ['watermelon', 'orange', 'apple', 'kiwi', 'grape']

  def initialize
    @secret = SECRET.sample.chars
  end
end