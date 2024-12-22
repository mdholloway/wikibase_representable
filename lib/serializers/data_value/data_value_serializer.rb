# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Serializers
    module DataValue
      # Serializer for data values
      class DataValueSerializer < Representable::Decorator
        include Representable::JSON

        property :type
        property :value
      end
    end
  end
end
