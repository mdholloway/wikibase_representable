# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Serializers
    module Statement
      # Serializer for a Wikibase statement
      class StatementSerializer < Representable::Decorator
        include Representable::JSON

        property :id
        property :rank
        property :mainsnak, decorator: PropertyValueSnakSerializer, class: PropertyValueSnak
        property :qualifiers, decorator: SnakListSerializer, class: SnakList
        property :references, decorator: SnakListSerializer, class: SnakList
      end
    end
  end
end
