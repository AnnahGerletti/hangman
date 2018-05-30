
# frozen_string_literal: true

# Dictionary::SECRET # => blueprint
# @dictionary = Dictionary.new # => house
class Dictionary
  attr_reader :word
  SECRET = %w[watermelon orange apple kiwi grape].freeze

  def initialize
    @word = SECRET.sample.chars
  end
end
