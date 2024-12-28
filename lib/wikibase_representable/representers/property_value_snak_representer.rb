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
      include WikibaseRepresentable::Model

      property :type, as: 'snaktype'
      property :property_id, as: 'property'
      property :hash
      property :data_value, as: 'datavalue', decorator: lambda { |input:, **|
        if input.type == EntityIdValue::TYPE
          EntityIdValueRepresenter
        elsif input.type == TimeValue::TYPE
          TimeValueRepresenter
        else
          DataValueRepresenter
        end
      }, class: lambda { |input:, **|
        if input['type'] == EntityIdValue::TYPE
          EntityIdValue
        elsif input['type'] == TimeValue::TYPE
          TimeValue
        else
          DataValue
        end
      }
    end
  end
end
