module Lunaticum::Game
  class Match < BaseModel
    attr_reader :current_iteration, :token

    def initialize(options={})
      @token = options[:token]
      @current_iteration = Iteration.new(self)
    end

    #создаем инфраструктуру новой игры
    class Builder

      BASE_PLAYERS_COUNT = 4

      def initialize(options)
        @players_count = options[:players_count] || BASE_PLAYERS_COUNT
      end

      def create!
        return unless (4..9).include?(@players_count)
        create_match
        create_players
        create_iteration
        create_deck
        @match_store
      end

      private

      def create_match
        @match_store = Store.create(type: :match, struct: match_attributes)
      end

      def create_players
        players_tokens = []
        players_count.times do
          players_tokens << Store.create(type: :player, struct: player_attributes(@match_store.token)).token
        end
        @match_store.players = players_tokens
      end

      def create_iteration
        @match_store.iterations = [ Store.create(type: :iteration, struct: iteration_attributes(@match_store.token)).token ]
      end

      def create_deck
        @match_store.deck = Store.create(type: :deck, struct: iteration_attributes(@match_store.token)).token
      end

      def match_attributes
        {players: [], iterations: []}
      end

      def player_attributes(match_token)
        {match: match_token}
      end

      def iteration_attributes(match_token)
        {match: match_token}
      end

      def deck_attributes
        {}
      end

    end
  end
end
