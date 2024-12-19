module Wikibase
  module DataModel
    module Snak
      class PropertyNoValueSnak < Snak
        def initialize(property_id:)
          @property_id = property_id
        end

        def type
          'novalue'
        end
      end
    end
  end
end
