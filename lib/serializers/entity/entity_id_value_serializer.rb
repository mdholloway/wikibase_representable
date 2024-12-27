# frozen_string_literal: true

require 'model/entity/entity_id'
require 'representable/json'
require 'serializers/entity/entity_id_serializer'

module Wikibase
  module Serializers
    module Entity
      # Serializer for data values referring to entity IDs
      class EntityIdValueSerializer < Representable::Decorator
        include Representable::JSON
        include Wikibase::DataModel::Entity

        property :value, decorator: EntityIdSerializer, class: EntityId
        property :type
      end
    end
  end
end
