module Wikibase
  module DataModel
    module Term
      class AliasGroup
        attr_reader :language, :aliases

        def initialize(language:, aliases: [])
          @language = language
          @aliases = []
        end

        def empty?
          @aliases.empty?
        end
      end
    end
  end
end
