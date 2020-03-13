# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'heartcheck/cas/version'

Gem::Specification.new do |spec|
  spec.name          = 'heartcheck-cas'
  spec.version       = Heartcheck::Cas::VERSION
  spec.authors       = ['andrerocker']
  spec.email         = ['andre.souza@gmail.com']

  spec.summary       = 'cas checkers to heartcheck'
  spec.description   = 'Provides cas checkers to heartcheck'
  spec.homepage      = 'http://github.com/locaweb/heartcheck-cas'
  spec.license       = 'MIT'
  spec.files         = Dir.glob('lib/**/*')
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.3'

  spec.add_dependency 'heartcheck', '~> 2.0'

  spec.add_development_dependency 'bundler', '> 1.6'
  spec.add_development_dependency 'pry-nav', '~> 0.2.4'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.3'
  spec.add_development_dependency 'rubocop'
end
