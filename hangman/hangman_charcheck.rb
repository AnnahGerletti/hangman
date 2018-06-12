class CharCheck

  def charactar_check?(guess)
    /\A[a-z]\z/.match?(guess)
  end

end