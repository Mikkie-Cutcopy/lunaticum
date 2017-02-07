class BaseModel
  include Lunaticum::Service::GameStore

  def initialize(token=nil)
    @token = token || generate_token
  end

end
