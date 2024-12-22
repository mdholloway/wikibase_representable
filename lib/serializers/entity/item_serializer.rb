# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Serializers
    module Entity
      # Serializer for Wikibase items
      class ItemSerializer < Representable::Decorator
        include Representable::JSON

        property :type
        property :id
        property :labels, decorator: TermListSerializer, class: TermList
        property :descriptions, decorator: TermListSerializer, class: TermList
        property :aliases, decorator: AliasGroupListSerializer, class: AliasGroupList
        property :claims, decorator: StatementListSerializer, class: StatementList
        property :sitelinks, decorator: SiteLinkListSerializer, class: SiteLinkList
      end
    end
  end
end
