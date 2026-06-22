# frozen_string_literal: true

require 'representable/json'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/entity_id_representer'

module WikibaseRepresentable
  module Representers
    # Representer for data values referring to entity IDs
    class EntityIdValueRepresenter < Representable::Decorator
      include Representable::JSON

      property :value, decorator: EntityIdRepresenter, class: Model::EntityId
      property :type
    end
  end
end
