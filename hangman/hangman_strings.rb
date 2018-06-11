class Strings
  attr_reader :design, :hi_msg, :lives_msg, :rules_msg
  def initialize
    @design = '**********************'
    @hi_msg = 'Welcome'
    @lives_msg = 'You have 10 lives'
    @rules_msg = 'Guess a letter between a-z'
  #   @design = design
  #   @hi_msg = hi_msg
  #   @lives_msg = lives_msg
  end
  
end

class SpanishStrings  
  attr_reader :design, :hi_msg, :lives_msg, :rules_msg
  def initialize
    @design = '**********************'
    @hi_msg = 'Hola'
    @lives_msg = 'Tienes 10 libres'
    @rules_msg = 'Adivina una carta entre a-z'
  #   @design = design
  #   @hi_msg = hi_msg
  #   @lives_msg = lives_msg
  end
end
