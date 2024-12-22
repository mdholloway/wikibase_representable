# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Serializers
    module Snak
      # Serializer for property value snaks.
      class PropertyValueSnakSerializer < Representable::Decorator
        include Representable::JSON

        property :property
        property :hash
        property :datavalue, decorator: DataValueSerializer, class: DataValue
      end
    end
  end
end
