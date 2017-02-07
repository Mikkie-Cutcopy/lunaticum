module Lunaticum::Game
class Player < BaseModel
  attr_reader :auth_token, :iteration, :player

  def initialize(auth_token=nil)
    super
    @iteration = Match.new(player_token: auth_token).current_iteration
  end

  def hundle(action)

    #проверяем что игрок имеет право на действие
    if action_rights.can?(action.name)
      send(action_name, options)
    end
    #проверяем состояние игры
    #
  end

  def start_game!

  end

  def set_word!(options)
    iteration.set_word!(self, options[:word])
  end

  def put_card!(options)
    iteration.put_card!(self, options[:val])
  end

  def guess_card!(options)
    iteration.guess_card!(self, options[:val])
  end

  def send_chat_msg(options)
    chat.send_msg(self, options)
  end

  private

  def action_rights
    @action_rights ||= ActionRights.new(iteration: iteration, player: player)
  end
end
end
