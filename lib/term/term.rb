# frozen_string_literal: true

module Wikibase
  module DataModel
    module Term
      # Immutable value object.
      class Term
        attr_reader :language_code, :value

        def initialize(language_code:, value:)
          @language = language_code
          @value = value
        end
      end
    end
  end
end
