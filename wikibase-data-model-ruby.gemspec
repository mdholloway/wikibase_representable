# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'wikibase-data-model-ruby'
  spec.version       = '0.1.0'
  spec.authors       = ['Michael Holloway']
  spec.email         = ['michael@mdholloway.org']

  spec.summary       = 'Wikibase data model classes'
  spec.description   = 'This is a partial port of the Wikibase DataModel classes from PHP to Ruby, focused on the needs of consumers.'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.69'
end
