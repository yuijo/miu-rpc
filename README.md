# Miu::RPC

Miu RPC extension

## Installation

Add this line to your application's Gemfile:

    gem 'miu-rpc'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install miu-rpc

## Usage

```ruby
class Handler
  def add(a, b)
    a + b
  end
end

server = Miu::RPC::Server.new 'inproc://myrpcserver', Handler.new
client = Miu::RPC::Client.new 'inproc://myrpcserver'

client.call :add, 1, 2 #=> 3

# with future
f = client.future.call :add, 1, 2
f.value #=> 3
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
