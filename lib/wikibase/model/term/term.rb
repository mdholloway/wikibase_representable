# frozen_string_literal: true

module Wikibase
  module Model
    module Term
      # Immutable value object.
      class Term
        attr_accessor :language_code, :value

        def initialize(language_code: nil, value: nil)
          @language_code = language_code
          @value = value
        end

        def ==(other)
          other.is_a?(self.class) &&
            @language_code == other.language_code &&
            @value == other.value
        end

        def eql?(other)
          self == other
        end
      end
    end
  end
end
