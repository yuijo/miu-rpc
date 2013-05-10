module Miu
  module RPC
    module Helpers
      def read_parts(socket)
        values = []
        loop do
          values << socket.read
          break unless socket.more_parts?
        end
        values
      end
    end
  end
end
