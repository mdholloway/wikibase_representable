# frozen_string_literal: true

require 'wikibase_representable/model/data_value'

module WikibaseRepresentable
  module Model
    # Data value representing an entity ID data value
    class EntityIdValue < DataValue
      TYPE = 'wikibase-entityid'

      def initialize(value: nil)
        super(type: TYPE, value: value)
      end

      def id
        @value.id
      end

      def entity_type
        @value.entity_type
      end

      def numeric_id
        @value.numeric_id
      end

      def state
        [@type, @value]
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
