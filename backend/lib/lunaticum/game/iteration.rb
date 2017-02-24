Lunaticum::Game
class Iteration < BaseModel

  def initialize(match)
    @match = match
    @word = store.word
  end

  def set_word!

  end

end
