# frozen_string_literal: true

module Wikibase
  module Model
    module Entity
      # Data value representing an entity ID data value
      class EntityId
        attr_accessor :id, :numeric_id, :entity_type

        def initialize(id: nil, numeric_id: nil, entity_type: nil)
          @id = id
          @numeric_id = numeric_id
          @entity_type = entity_type
        end

        def ==(other)
          other.is_a?(self.class) &&
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
end
