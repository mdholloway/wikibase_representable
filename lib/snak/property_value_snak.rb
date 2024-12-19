module Wikibase
  module DataModel
    module Snak
      class PropertyValueSnak < Snak
        attr_reader :data_value

        def initialize(property_id:, data_value:)
          @property_id = property_id
          @data_value = data_value
        end

        def type
          'value'
        end
      end
    end
  end
end
