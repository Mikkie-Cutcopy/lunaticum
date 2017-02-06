#!/usr/bin/env ruby
# encoding: utf-8


require 'rubygems'
require 'bundler/setup'

require 'em-websocket-client'
#require 'amqp'

module Lunaticum

  module Client
    module_function

    def start
      EM.run do
        conn = EventMachine::WebSocketClient.connect("ws://localhost:3030")
        conn.callback do
          conn.send_msg "done1"
        end
        conn2 = EventMachine::WebSocketClient.connect("ws://localhost:3030")
        conn2.callback do
          conn2.send_msg "done2"
        end
      end
    end

  end

end

Lunaticum::Client.start
