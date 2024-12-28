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

        property :type
        property :id
        property :labels, decorator: Wikibase::Representers::Term::TermListRepresenter,
                          class: Wikibase::Model::Term::TermList
        property :descriptions, decorator: Wikibase::Representers::Term::TermListRepresenter,
                                class: Wikibase::Model::Term::TermList
        property :alias_groups, as: 'aliases', decorator: Wikibase::Representers::Term::AliasGroupListRepresenter,
                                class: Wikibase::Model::Term::AliasGroupList
        property :statements, as: 'claims', decorator: Wikibase::Representers::Statement::StatementListRepresenter,
                              class: Wikibase::Model::Statement::StatementList
        property :site_links, as: 'sitelinks', decorator: Wikibase::Representers::SiteLinkListRepresenter,
                              class: Wikibase::Model::SiteLinkList
      end
    end
  end
end
