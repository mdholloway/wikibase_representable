# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Serializers
    module Entity
      # Serializer for Wikibase properties
      class PropertySerializer < Representable::Decorator
        include Representable::JSON

        property :type
        property :datatype
        property :id
        property :labels, decorator: TermListSerializer, class: TermList
        property :descriptions, decorator: TermListSerializer, class: TermList
        property :aliases: decorator: AliasGroupListSerializer, class: AliasGroupList
        property :claims, decorator: StatementListSerializer, class: StatementList
      end
    end
  end
end
