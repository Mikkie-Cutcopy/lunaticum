require 'securerandom'
require 'redis'
require 'json'

module Lunaticum::Service::GameStore

  def store
    @store ||= Store.new(token)
  end

  class Store

    attr_reader :token

    def initialize(token=nil)
      @token = token || generate_token
    end

    # store.random_key = val
    # srore.random_key
    # => val
    def method_missing(method_name, *args)
      if /(?<set_method>.+)=$/ =~ method_name
        set_value(object.merge(set_method => args[0]))
      else
        object[method_name.to_s]
      end
    end

    def object
      set_initial_value unless get_value
      JSON.parse( get_value )
    end

    private

    def set_initial_value
      return if get_value
      set_value({})
    end

    def set_value(val)
      redis.set(@token, val.to_json)
    end

    def get_value
      redis.get(token)
    end

    def redis
      @redis ||= Redis.new(:host => "localhost", :port => 6379)
    end

    def generate_token
      token = SecureRandom.hex 8
      redis.get(token) ? generate_token : token
    end

  end
end
