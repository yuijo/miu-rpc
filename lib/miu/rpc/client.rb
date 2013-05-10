require 'miu/rpc/helpers'

module Miu
  module RPC
    class Client
      include Celluloid::ZMQ

      class Evaluator
        include Saorin::Client::Base
        include Helpers

        def initialize(socket)
          super :formatter => MessagePack
          @socket = socket
        end

        def send_request(content)
          @socket.write content
          read_parts(@socket)[0]
        end
      end

      def initialize(address)
        @socket = DealerSocket.new
        @socket.connect address
        @evaluator = Evaluator.new @socket
      end

      def close
        @socket.close
      end

      def call(method, *args)
        @evaluator.call method, *args
      rescue Exception => e
        abort e
      end

      def notify(method, *args)
        @evaluator.notify method, *args
      rescue Exception => e
        abort e
      end
    end
  end
end
