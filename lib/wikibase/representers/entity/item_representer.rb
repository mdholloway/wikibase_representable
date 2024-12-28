# frozen_string_literal: true

require 'representable/json'
require 'wikibase/model/site_link_list'
require 'wikibase/model/statement/statement_list'
require 'wikibase/model/term/alias_group_list'
require 'wikibase/model/term/term_list'
require 'wikibase/representers/site_link_list_representer'
require 'wikibase/representers/statement/statement_list_representer'
require 'wikibase/representers/term/alias_group_list_representer'
require 'wikibase/representers/term/term_list_representer'

module Wikibase
  module Representers
    module Entity
      # Representer for Wikibase items
      class ItemRepresenter < Representable::Decorator
        include Representable::JSON
        include Wikibase::Model
        include Wikibase::Model::Statement
        include Wikibase::Model::Term
        include Wikibase::Representers
        include Wikibase::Representers::Statement
        include Wikibase::Representers::Term

        property :type
        property :id
        property :labels, decorator: TermListRepresenter, class: TermList
        property :descriptions, decorator: TermListRepresenter, class: TermList
        property :alias_groups, as: 'aliases', decorator: AliasGroupListRepresenter, class: AliasGroupList
        property :statements, as: 'claims', decorator: StatementListRepresenter, class: StatementList
        property :site_links, as: 'sitelinks', decorator: SiteLinkListRepresenter, class: SiteLinkList
      end
    end
  end
end
