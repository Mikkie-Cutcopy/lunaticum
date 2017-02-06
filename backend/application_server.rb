#!/usr/bin/env ruby
# encoding: utf-8


require 'rubygems'
require 'bundler/setup'

require_relative 'lib/lunaticum'
require 'em-websocket'
require 'amqp'

module Lunaticum

  module ApplicationServer
    module_function

    def start

      EM.run {
        EM::WebSocket.run(:host => "0.0.0.0", :port => 3030) do |ws|
          connection = Lunaticum::Service::Rabbit.new
          connection.incoming_queue = connection.establish(INCOMINGS_QUEUE_NAME).()

          ws.onopen { |handshake|
            #connection.options = handshake
            connection.outcoming_queue = connection.establish('test').()
            connection.outcoming_queue.subscribe do |payload|
              ws.send payload
            end
            puts "WebSocket connection open"
          }

          ws.onclose { connection.incoming_queue.publish 'exit' }

          ws.onmessage { |msg|
            connection.incoming_queue.publish msg
            puts msg
            #ws.send response.to_json
          }
        end
      }
    end

  end

end

Lunaticum::ApplicationServer.start
#
