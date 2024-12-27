# frozen_string_literal: true

require 'model/site_link_list'
require 'model/statement/statement_list'
require 'model/term/alias_group_list'
require 'model/term/term_list'
require 'representable/json'
require 'representers/site_link_list_representer'
require 'representers/statement/statement_list_representer'
require 'representers/term/alias_group_list_representer'
require 'representers/term/term_list_representer'

module Wikibase
  module Representers
    module Entity
      # Representer for Wikibase items
      class ItemRepresenter < Representable::Decorator
        include Representable::JSON
        include Wikibase::DataModel
        include Wikibase::DataModel::Statement
        include Wikibase::DataModel::Term
        include Wikibase::Representers
        include Wikibase::Representers::Statement
        include Wikibase::Representers::Term

        property :type
        property :id
        property :labels, decorator: TermListRepresenter, class: TermList
        property :descriptions, decorator: TermListRepresenter, class: TermList
        property :alias_groups, as: 'aliases', decorator: AliasGroupListRepresenter, class: AliasGroupList
        property :statements, as: 'claims', decorator: StatementListRepresenter, class: StatementList
        property :sitelinks, decorator: SiteLinkListRepresenter, class: SiteLinkList
      end
    end
  end
end
