# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'wikibase-data-model-ruby'
  spec.version       = '0.1.0'
  spec.authors       = ['Michael Holloway']
  spec.email         = ['michael@mdholloway.org']

  spec.summary       = 'Wikibase data model classes'
  spec.description   = 'A partial port of the Wikibase DataModel classes from PHP to Ruby.'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 3.3'
  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.69'
end
