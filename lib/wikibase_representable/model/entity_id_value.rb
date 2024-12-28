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

      def ==(other)
        other.is_a?(self.class) &&
          type == other.type &&
          id == other.id &&
          entity_type == other.entity_type &&
          numeric_id == other.numeric_id
      end

      def eql?(other)
        self == other
      end
    end
  end
end
