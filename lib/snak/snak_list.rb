# frozen_string_literal: true

module Wikibase
  module DataModel
    module Snak
      # List of Snak objects.
      class SnakList
        def initialize(snaks: [])
          @snaks = snaks
        end
      end
    end
  end
end
