# frozen_string_literal: true

require 'model/snak/property_value_snak'
require 'representable/json/hash'
require 'serializers/snak/property_value_snak_serializer'

module Wikibase
  module Serializers
    module Snak
      # Serializer for a list of (property value) snaks.
      class SnakListSerializer < Representable::Decorator
        include Representable::JSON::Hash
        include Wikibase::DataModel::Snak

        values decorator: PropertyValueSnakSerializer, class: PropertyValueSnak
      end
    end
  end
end
