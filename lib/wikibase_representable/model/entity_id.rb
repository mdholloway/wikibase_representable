# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Data value representing an entity ID data value
    class EntityId
      attr_accessor :id, :numeric_id, :entity_type

      def initialize(id: nil, numeric_id: nil, entity_type: nil)
        @id = id
        @numeric_id = numeric_id
        @entity_type = entity_type
      end

      def state
        [id, numeric_id, entity_type]
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
