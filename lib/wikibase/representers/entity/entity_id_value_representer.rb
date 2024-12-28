# frozen_string_literal: true

require 'representable/json'
require 'wikibase/model/entity/entity_id'
require 'wikibase/representers/entity/entity_id_representer'

module Wikibase
  module Representers
    module Entity
      # Representer for data values referring to entity IDs
      class EntityIdValueRepresenter < Representable::Decorator
        include Representable::JSON
        include Wikibase::Model::Entity

        property :value, decorator: EntityIdRepresenter, class: EntityId
        property :type
      end
    end
  end
end
