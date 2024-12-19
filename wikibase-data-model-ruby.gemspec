# frozen_string_literal: true

Gem::Specification.new do |spec|
    spec.name          = "wikibase-data-model-ruby"
    spec.version       = "0.1.0"
    spec.authors       = ["Michael Holloway"]
    spec.email         = ["michael@mdholloway.org"]

    spec.summary       = %q{Model classes for working with Wikibase data}
    spec.description   = %q{This is a relatively direct port of the Wikibase DataModel PHP library to Ruby. It provides a set of classes for working with Wikibase data.}
    spec.license       = "MIT"

    spec.files         = Dir["lib/**/*.rb"]
    spec.require_paths = ["lib"]

    spec.add_development_dependency "bundler", "~> 2.0"
    spec.add_development_dependency "rake", "~> 13.0"
end