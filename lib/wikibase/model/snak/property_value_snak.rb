# frozen_string_literal: true

module Wikibase
  module Model
    module Snak
      # Class representing a property value snak.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#PropertyValueSnak
      class PropertyValueSnak
        SNAK_TYPE = 'value'

        attr_accessor :type, :property_id, :data_value, :hash

        def initialize(type: SNAK_TYPE, property_id: nil, data_value: nil, hash: nil)
          @type = type
          @property_id = property_id
          @data_value = data_value
          @hash = hash
        end

        def ==(other)
          other.is_a?(self.class) &&
            other.type == type &&
            other.property_id == property_id &&
            other.data_value == data_value &&
            other.hash == hash
        end

        def eql?(other)
          self == other
        end
      end
    end
  end
end
