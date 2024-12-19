# frozen_string_literal: true

module Wikibase
  module DataModel
    module Snak
      # Class representing a property no value snak.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#PropertyNoValueSnak
      class PropertyNoValueSnak < Snak
        def type
          'novalue'
        end
      end
    end
  end
end
