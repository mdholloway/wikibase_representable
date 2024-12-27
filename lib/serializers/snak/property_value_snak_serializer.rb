# frozen_string_literal: true

require 'model/data_value/data_value'
require 'model/entity/entity_id_value'
require 'representable/json'
require 'serializers/data_value/data_value_serializer'
require 'serializers/entity/entity_id_serializer'
require 'serializers/entity/entity_id_value_serializer'

module Wikibase
  module Serializers
    module Snak
      # Serializer for property value snaks.
      class PropertyValueSnakSerializer < Representable::Decorator
        include Representable::JSON
        include Wikibase::DataModel::DataValue
        include Wikibase::DataModel::Entity
        include Wikibase::Serializers::DataValue
        include Wikibase::Serializers::Entity

        property :type, as: 'snaktype'
        property :property_id, as: 'property'
        property :hash
        property :data_value, as: 'datavalue', decorator: lambda { |input:, **|
          input.type == EntityIdValue::TYPE ? EntityIdValueSerializer : DataValueSerializer
        }, class: lambda { |input:, **|
          input['type'] == EntityIdValue::TYPE ? EntityIdValue : Wikibase::DataModel::DataValue::DataValue
        }
      end
    end
  end
end
