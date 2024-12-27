# frozen_string_literal: true

require 'model/snak/property_value_snak'
require 'model/snak/snak_list'
require 'representable/json'
require 'serializers/snak/property_value_snak_serializer'
require 'serializers/snak/snak_list_serializer'

module Wikibase
  module Serializers
    module Statement
      # Serializer for a Wikibase statement
      class StatementSerializer < Representable::Decorator
        include Representable::JSON
        include Wikibase::DataModel::Snak
        include Wikibase::Serializers::Snak

        property :main_snak, as: 'mainsnak', decorator: PropertyValueSnakSerializer, class: PropertyValueSnak
        property :qualifiers, decorator: SnakListSerializer, class: SnakList
        property :type
        property :guid, as: 'id'
        property :rank

        collection_representer class: Wikibase::DataModel::Statement::Statement
      end
    end
  end
end
