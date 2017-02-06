class Lunaticum::Game::Match

  attr_reader :current_iteration, :token

  def initialize(token)
    @token = token
    @current_iteration = Iteration.new(store.current_iteraton_token)
  end


end