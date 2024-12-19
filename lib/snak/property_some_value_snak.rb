module Wikibase
  module DataModel
    module Snak
      class PropertySomeValueSnak < Snak
        def initialize(property_id:)
          @property_id = property_id
        end

        def type
          'somevalue'
        end
      end
    end
  end
end
