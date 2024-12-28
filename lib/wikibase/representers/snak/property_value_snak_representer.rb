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
        include Wikibase::DataModel::DataValue
        include Wikibase::DataModel::Entity
        include Wikibase::Representers::DataValue
        include Wikibase::Representers::Entity

        property :type, as: 'snaktype'
        property :property_id, as: 'property'
        property :hash
        property :data_value, as: 'datavalue', decorator: lambda { |input:, **|
          input.type == EntityIdValue::TYPE ? EntityIdValueRepresenter : DataValueRepresenter
        }, class: lambda { |input:, **|
          input['type'] == EntityIdValue::TYPE ? EntityIdValue : Wikibase::DataModel::DataValue::DataValue
        }
      end
    end
  end
end
