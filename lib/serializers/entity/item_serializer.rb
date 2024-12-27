# frozen_string_literal: true

require 'model/site_link_list'
require 'model/statement/statement_list'
require 'model/term/alias_group_list'
require 'model/term/term_list'
require 'representable/json'
require 'serializers/site_link_list_serializer'
require 'serializers/statement/statement_list_serializer'
require 'serializers/term/alias_group_list_serializer'
require 'serializers/term/term_list_serializer'

module Wikibase
  module Serializers
    module Entity
      # Serializer for Wikibase items
      class ItemSerializer < Representable::Decorator
        include Representable::JSON
        include Wikibase::DataModel
        include Wikibase::DataModel::Statement
        include Wikibase::DataModel::Term
        include Wikibase::Serializers
        include Wikibase::Serializers::Statement
        include Wikibase::Serializers::Term

        property :type
        property :id
        property :labels, decorator: TermListSerializer, class: TermList
        property :descriptions, decorator: TermListSerializer, class: TermList
        property :alias_groups, as: 'aliases', decorator: AliasGroupListSerializer, class: AliasGroupList
        property :statements, as: 'claims', decorator: StatementListSerializer, class: StatementList
        property :sitelinks, decorator: SiteLinkListSerializer, class: SiteLinkList
      end
    end
  end
end
