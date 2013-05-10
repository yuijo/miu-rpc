# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'miu/rpc/version'

Gem::Specification.new do |spec|
  spec.name          = 'miu-rpc'
  spec.version       = Miu::RPC::VERSION
  spec.authors       = ['mashiro']
  spec.email         = ['mail@mashiro.org']
  spec.description   = %q{miu rpc extension}
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/yuijo/miu-rpc'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'miu', '>= 0.2.0'
  spec.add_dependency 'celluloid-zmq', '>= 0.14.0'
  spec.add_dependency 'saorin', '>= 0.5.0'
  spec.add_dependency 'saorin-msgpack', '>= 0.0.2'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
