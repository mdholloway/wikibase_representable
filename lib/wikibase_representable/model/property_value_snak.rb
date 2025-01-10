# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Class representing a property value snak.
    # See https://www.mediawiki.org/wiki/Wikibase/DataModel#PropertyValueSnak
    class PropertyValueSnak
      include SnakDataValueHelper

      SNAK_TYPE = 'value'

      attr_accessor :type, :property_id, :data_value, :hash

      def initialize(type: SNAK_TYPE, property_id: nil, data_value: nil, hash: nil)
        @type = type
        @property_id = property_id
        @data_value = data_value
        @hash = hash
      end

      def state
        [@type, @property_id, @data_value, @hash]
      end

      def ==(other)
        other.class == self.class && other.state == state
      end

      def eql?(other)
        self == other
      end
    end
  end
end
