require 'spec_helper'

describe Miu::RPC do
  before :all do
    c = Class.new do
      def add(a, b)
        a + b
      end
    end
    address = 'inproc://rspec_server'
    Miu::RPC::Server.supervise_as :server, address, c.new
    @client = Miu::RPC::Client.new address
  end

  after :all do
    @client.close
    Celluloid::Actor[:server].close
  end

  it { expect(@client.call :add, 1, 2).to eq 3 }
  it { expect { @client.call :sub, 1, 2 }.to raise_error(Saorin::MethodNotFound) }
end
