module Lunaticum::Service::GameStore

  def store
    @redis ||= Redis.new(:host => "localhost", :port => 6379)
  end

  def game_auth_token
    @game_auth_token = store.get(store_val_from(:current_game_token))
  end

  def score
    @score = store.get(store_val_from(:score))
  end

  def store_val_from(key)
    [:player, @auth_token, key].map(&:to_s).join(':')
  end
end