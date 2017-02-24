module Lunaticum::Game
  class Player < BaseModel
    attr_reader :auth_token, :iteration, :game_state

    def self.find(token)

    end

    def initialize(token=nil)
      super
      @iteration     = Match.find(auth_token).current_iteration
      #@game_state    = Services::GameState.new(self)
      #@action_rights = Policies::PlayerPolicy.new(iteration: iteration, player: self)
    end

    def hundle(action)

      #проверяем что игрок имеет право на действие
      if action_rights.can?(action.name)
        send(action_name, options)
      end
      #проверяем состояние игры
      #
    end

    def current_state(options)
      #methods: all, chat, board, player_cards
      game_state.send(options[:method])
    end

    def start_game!

    end

    def set_word!(options)
      iteration.action!(:set_word!, self, options[:word])
      #iteration.set_word!(self, options[:word])
    end

    def put_card!(options)
      iteration.action!(:set_word!, self, options[:word])
      #iteration.put_card!(self, options[:val])
    end

    def guess_card!(options)
      iteration.action!(:set_word!, self, options[:word])
      #iteration.guess_card!(self, options[:val])
    end

    def send_chat_msg(options)
      iteration.action!(:set_word!, self, options[:word])
      #chat.send_msg(self, options)
    end


  end
end
