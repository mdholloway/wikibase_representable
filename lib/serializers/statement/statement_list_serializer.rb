# frozen_string_literal: true

require 'model/statement/statement'
require 'representable/json/hash'
require 'serializers/statement/statement_serializer'

module Wikibase
  module Serializers
    module Statement
      # Serializer for a hash of property IDs => statement arrays.
      class StatementListSerializer < Representable::Decorator
        include Representable::JSON::Hash
        include Wikibase::DataModel::Statement

        values decorator: StatementSerializer.for_collection, instance: []
      end
    end
  end
end
