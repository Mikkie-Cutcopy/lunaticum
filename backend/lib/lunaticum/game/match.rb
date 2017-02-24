module Lunaticum::Game
  class Match < BaseModel
    attr_reader :current_iteration, :token

    def initialize(options={})
      @token = options[:token]
      @current_iteration = Iteration.new(self)
    end

    #создаем инфраструктуру новой игры в редис
    class Builder

      def self.start!(deck=nil)
        Match.new
      end


    end
  end
end
