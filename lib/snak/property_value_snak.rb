# frozen_string_literal: true

module Wikibase
  module DataModel
    module Snak
      # Class representing a property value snak.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#PropertyValueSnak
      class PropertyValueSnak < Snak
        attr_reader :data_value

        def initialize(property_id:, data_value:)
          super(property_id: property_id)
          @data_value = data_value
        end

        def type
          'value'
        end
      end
    end
  end
end
