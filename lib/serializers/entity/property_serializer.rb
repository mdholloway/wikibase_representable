# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Serializers
    module Entity
      # Serializer for Wikibase properties
      class PropertySerializer < Representable::Decorator
        include Representable::JSON
        include Wikibase::DataModel::Statement
        include Wikibase::DataModel::Term
        include Wikibase::Serializers::Statement
        include Wikibase::Serializers::Term

        property :type
        property :data_type, as: 'datatype'
        property :id
        property :labels, decorator: TermListSerializer, class: TermList
        property :descriptions, decorator: TermListSerializer, class: TermList
        property :alias_groups, as: 'aliases', decorator: AliasGroupListSerializer, class: AliasGroupList
        property :statements, as: 'claims', decorator: StatementListSerializer, class: StatementList
      end
    end
  end
end
