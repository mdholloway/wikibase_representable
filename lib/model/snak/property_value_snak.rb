# frozen_string_literal: true

module Wikibase
  module DataModel
    module Snak
      # Class representing a property value snak.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#PropertyValueSnak
      class PropertyValueSnak
        SNAK_TYPE = 'value'

        attr_reader :property, :data_value, :hash

        def initialize(property_id:, data_value:, hash:)
          @property = property_id
          @data_value = data_value
          @hash = hash
        end

        def type
          SNAK_TYPE
        end
      end
    end
  end
end
