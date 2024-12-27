# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'wikibase-data-model-ruby'
  spec.version       = '0.1.0'
  spec.authors       = ['Michael Holloway']
  spec.email         = ['michael@mdholloway.org']

  spec.summary       = 'Work with Wikibase data fluently in Ruby'
  spec.description   = 'Provides Wikibase data model classes and facilities for marshalling and unmarshalling Wikibase data objects to and from JSON.'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.3'
  spec.metadata['rubygems_mfa_required'] = 'true'

  spec.files         = Dir['lib/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_dependency 'multi_json', '~> 1.15'
  spec.add_dependency 'representable', '~> 3.2'
  spec.add_development_dependency 'bundler', '~> 2.6'
  spec.add_development_dependency 'rake', '~> 13.2'
  spec.add_development_dependency 'rspec', '~> 3.13'
  spec.add_development_dependency 'rubocop', '~> 1.69'
  spec.add_development_dependency 'rubocop-rake', '~> 0.6'
  spec.add_development_dependency 'rubocop-rspec', '~> 3.3'
end
