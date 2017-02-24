#The web UI is located at: http://server-name:15672/
class Lunaticum::Utils::Rabbit

  attr_accessor :incoming_queue, :outcoming_queue, :outcoming_queue_name

  Queue = Struct.new(:q, :x, :ch) do

    def publish(msg)
      x.publish msg, :routing_key => q.name, :persistent => true
    end

    def subscribe
      q.subscribe{ |payload| yield payload }
    end

  end

  def establish(outcoming_queue_name)
    @outcoming_queue_name = outcoming_queue_name
    lambda do
      ch  = connect_to_channel.()
      q   = ch.queue(outcoming_queue_name)
      x   = ch.default_exchange
      return Queue.new(q, x, ch)
    end
  end

  def connect_to_channel
    lambda do
      connection = AMQP.connect(:host => '127.0.0.1')
      puts "Connecting to RabbitMQ. Running #{AMQP::VERSION} version of the gem..."
      ch  = AMQP::Channel.new(connection)
    end
  end

end
