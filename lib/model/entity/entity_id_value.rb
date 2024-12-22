# frozen_string_literal: true

module Wikibase
  module DataModel
    module Entity
      # Data value representing an entity ID
      class EntityIdValue < DataValue
        TYPE = 'wikibase-entityid'

        attr_reader :id, :entity_type, :numeric_id

        def initialize(id:, entity_type:, numeric_id:)
          super(type: TYPE)
          @id = id
          @entity_type = entity_type
          @numeric_id = numeric_id
        end
      end
    end
  end
end
