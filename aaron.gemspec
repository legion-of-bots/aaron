# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aaron/version'

Gem::Specification.new do |spec|
  spec.name          = 'aaron'
  spec.version       = Aaron::VERSION
  spec.authors       = ['William Yaworsky']
  spec.email         = ['wj.px01@gmail.com']
  spec.summary       = %q{Randomized cron.}
  spec.homepage      = 'https://github.com/yaworsw/aaron'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency 'commander'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'

  spec.add_development_dependency 'rspec',  '~> 3.2.0'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-rescue'
  spec.add_development_dependency 'pry-stack_explorer'
end
