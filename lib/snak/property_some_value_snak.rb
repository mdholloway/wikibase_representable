# frozen_string_literal: true

module Wikibase
  module DataModel
    module Snak
      # Class representing a property some value snak.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#PropertySomeValueSnak
      class PropertySomeValueSnak < Snak
        def type
          'somevalue'
        end
      end
    end
  end
end
