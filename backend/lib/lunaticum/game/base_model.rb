class BaseModel
  include Lunaticum::Service::GameStore

  def initialize(token=nil)
    @token = token
  end

end
