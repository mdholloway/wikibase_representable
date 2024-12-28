# frozen_string_literal: true

require 'representable/json'

module WikibaseRepresentable
  module Representers
    # Representer for data values representing entity IDs
    class EntityIdRepresenter < Representable::Decorator
      include Representable::JSON

      property :entity_type, as: 'entity-type'
      property :numeric_id, as: 'numeric-id'
      property :id
    end
  end
end
