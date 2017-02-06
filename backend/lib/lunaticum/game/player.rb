class Lunaticum::Game::Player
  include Lunaticum::Service::GameStore

  attr_reader :auth_token, :iteration, :player

  def initialize(auth_token)
    @auth_token = auth_token
    #@player = Player.new(auth_token)
    @iteration = Match.new(game_auth_token).current_iteration
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