#!/usr/bin/env ruby
# encoding: utf-8

require 'rubygems'
require 'bundler/setup'

require_relative 'lib/lunaticum'
require 'em-websocket'
require 'amqp'

module Lunaticum
  module GameServer
    module_function

    def start
      EM.run {
        #outcomming_channel = Lunaticum::Service::Rabbit.new.connect_to_channel
        Lunaticum::Service::Rabbit.new.establish(INCOMINGS_QUEUE_NAME).().subscribe do |payload|
          #message = ::Service::Message.new(payload)
          #response = ::Game::Player.new(message.player).hundle(message.action)
          #x = outcomming_channel.fanout(response.exchange)
          #x.publish response.to_json
          puts "Received a message: #{payload}."
        end
      }
    end
  end
end

Lunaticum::GameServer.start