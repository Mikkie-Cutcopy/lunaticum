class Lunaticum::Service::Message

  attr_accessor :player, :action, :params, :time

  def initialize(msg)
    options = JSON.parse(msg)
    @player = options[:player]
    @action = options[:action]
    @params = options[:params]
    @time =   DateTime.parse options[:time]
  end

end
