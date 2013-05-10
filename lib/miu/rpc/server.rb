require 'miu/rpc/helpers'

module Miu
  module RPC
    class Server
      include Celluloid::ZMQ
      include Helpers

      class Evaluator
        include Saorin::Server::Base
        
        def initialize(handler)
          super handler, :formatter => MessagePack
        end
      end

      def initialize(address, handler)
        @socket = Celluloid::ZMQ::RouterSocket.new
        @socket.bind address
        @evaluator = Evaluator.new handler

        async.run
      end

      def close
        @socket.close
        terminate
      end

      def run
        loop do
          parts = read_parts @socket
          async.handle_message parts
        end
      end

      def handle_message(parts)
        id, request = parts
        response = @evaluator.process_request request
        @socket.write id, response
      end
    end
  end
end
