# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Serializers
    module Entity
      # Serializer for Wikibase items
      class EntityIdValueSerializer < Representable::Decorator
        include Representable::JSON

        property :entity-type
        property :numeric-id
        property :id
      end
    end
  end
end
