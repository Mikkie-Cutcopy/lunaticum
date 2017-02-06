module Lunaticum
  INCOMINGS_QUEUE_NAME = "amqp.lunaticum.incomings".freeze

  module Service
    require_relative 'lunaticum/services/game_store'
    require_relative 'lunaticum/services/rabbit'
    require_relative 'lunaticum/services/message'
  end

  module Policies
    require_relative 'lunaticum/policies/player_policy'
  end

  module Game
    require_relative 'lunaticum/game/iteration'
    require_relative 'lunaticum/game/match'
    require_relative 'lunaticum/game/player'
  end

end