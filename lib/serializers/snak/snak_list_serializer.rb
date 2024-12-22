# frozen_string_literal: true

require 'representable/json/hash'

module Wikibase
  module Serializers
    module Snak
      # Serializer for a list of (property value) snaks.
      class SnakListSerializer< Representable::Decorator
        include Representable::JSON::Hash

        values decorator: PropertyValueSnakSerializer, class: PropertyValueSnak
      end
    end
  end
end
