# frozen_string_literal: true

module Wikibase
  module DataModel
    module Snak
      # Objects that represents a generic Wikibase snak.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Snaks
      class Snak
        attr_reader :property_id

        def initialize(property_id:)
          @property_id = property_id
        end
      end
    end
  end
end
