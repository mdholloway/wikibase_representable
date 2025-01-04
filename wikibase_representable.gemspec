# frozen_string_literal: true

require_relative 'lib/wikibase_representable/version'

Gem::Specification.new do |spec|
  spec.name = 'wikibase_representable'
  spec.version       = WikibaseRepresentable::VERSION
  spec.authors       = ['Michael Holloway']
  spec.email         = ['michael@mdholloway.org']

  spec.summary       = 'Work with Wikibase data fluently in Ruby'
  spec.description   = 'Provides Wikibase data model classes and support for serializing and deserializing ' \
                       'Wikibase entities to and from JSON.'
  spec.homepage      = 'https://github.com/mdholloway/wikibase_representable'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0'

  spec.metadata['rubygems_mfa_required'] = 'true'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
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
