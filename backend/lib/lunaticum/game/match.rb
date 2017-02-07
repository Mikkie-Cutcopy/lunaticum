module Lunaticum::Game
  class Match < BaseModel
    attr_reader :current_iteration, :token

    def initialize(options={})

      @current_iteration = Iteration.new(store.current_iteraton_token)
    end
  end
end
