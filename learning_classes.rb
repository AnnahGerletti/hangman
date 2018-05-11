# creating a song and lyric class obj example taken from Learn Ruby the hard way lesson 40

class Sing
  def initialize(lyrics)
    @lyrics = lyrics
  end

  def sing_me_a_song()
    puts @lyrics}
  end
end

happy_bday = Sing.new('Happy Birthday to you')