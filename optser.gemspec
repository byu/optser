# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'optser/version'

Gem::Specification.new do |gem|
  gem.name          = 'optser'
  gem.version       = Optser::VERSION
  gem.authors       = ['Benjamin Yu']
  gem.email         = ['benjaminlyu@gmail.com']
  gem.description   = 'Handle options from a set of arguments'
  gem.summary       = 'Handle options from a set of arguments'
  gem.homepage      = 'http://github.com/byu/optser'
  gem.licenses    = ['Apache 2.0']

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency('hashie', ['>= 1.2.0'])
end
