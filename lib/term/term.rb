module Wikibase
  module DataModel
    module Term
      class Term
        attr_reader :language, :value

        def initialize(language:, value:)
          @language = language
          @value = value
        end
      end
    end
  end
end
