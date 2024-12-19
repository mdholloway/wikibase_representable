# frozen_string_literal: true

module Wikibase
  module DataModel
    module Term
      # Ordered list of aliases. Immutable value object.
      class AliasGroup
        attr_reader :language, :aliases

        def initialize(language:, aliases: [])
          @language = language
          @aliases = aliases
        end

        def empty?
          @aliases.empty?
        end
      end
    end
  end
end
