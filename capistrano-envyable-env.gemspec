# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano-envyable-export'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-envyable-export'
  spec.version       = Capistrano::EnvyableExport::VERSION
  spec.authors       = ['Victor Goya']
  spec.email         = ['victor.goya@precogs.com']
  spec.description   = %q{Write your Envyable configuration as .env file on the remote server}
  spec.summary       = %q{Write your Envyable configuration as .env file on the remote server}
  spec.homepage      = 'https://github.com/phorque/capistrano-envyable-export'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', '~> 3.0'
  spec.add_dependency 'sshkit',     '>= 1.2.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
