# frozen_string_literal: true

module Wikibase
  module DataModel
    module Term
      # Ordered list of aliases. Immutable value object.
      class AliasGroup
        attr_reader :language_code, :aliases

        def initialize(language_code:, aliases: [])
          @language_code = language_code
          @aliases = aliases
        end

        def empty?
          @aliases.empty?
        end
      end
    end
  end
end
