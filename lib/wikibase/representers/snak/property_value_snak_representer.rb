# frozen_string_literal: true

require 'representable/json'
require 'wikibase/model/data_value/data_value'
require 'wikibase/model/entity/entity_id_value'
require 'wikibase/representers/data_value/data_value_representer'
require 'wikibase/representers/entity/entity_id_representer'
require 'wikibase/representers/entity/entity_id_value_representer'

module Wikibase
  module Representers
    module Snak
      # Representer for property value snaks.
      class PropertyValueSnakRepresenter < Representable::Decorator
        include Representable::JSON

        property :type, as: 'snaktype'
        property :property_id, as: 'property'
        property :hash
        property :data_value, as: 'datavalue', decorator: lambda { |input:, **|
          if input.type == Wikibase::Model::Entity::EntityIdValue::TYPE
            Wikibase::Representers::Entity::EntityIdValueRepresenter
          else
            Wikibase::Representers::DataValue::DataValueRepresenter
          end
        }, class: lambda { |input:, **|
          if input['type'] == Wikibase::Model::Entity::EntityIdValue::TYPE
            Wikibase::Model::Entity::EntityIdValue
          else
            Wikibase::Model::DataValue::DataValue
          end
        }
      end
    end
  end
end
