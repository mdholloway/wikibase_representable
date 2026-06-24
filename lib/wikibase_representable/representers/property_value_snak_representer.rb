# frozen_string_literal: true

require 'representable/json'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/data_value_representer'
require 'wikibase_representable/representers/entity_id_value_representer'
require 'wikibase_representable/representers/time_value_representer'

module WikibaseRepresentable
  module Representers
    # Representer for property value snaks.
    class PropertyValueSnakRepresenter < Representable::Decorator
      include Representable::JSON

      property :type, as: 'snaktype'
      property :property_id, as: 'property'
      property :hash
      property :data_value, as: 'datavalue', decorator: lambda { |input:, **|
        if input.is_a? Model::EntityIdValue
          EntityIdValueRepresenter
        elsif input.is_a? Model::TimeValue
          TimeValueRepresenter
        else
          DataValueRepresenter
        end
      }, class: lambda { |input:, **|
        if input['type'] == Model::EntityIdValue::TYPE
          Model::EntityIdValue
        elsif input['type'] == Model::TimeValue::TYPE
          Model::TimeValue
        else
          Model::DataValue
        end
      }

      collection_representer class: Model::PropertyValueSnak
    end
  end
end
