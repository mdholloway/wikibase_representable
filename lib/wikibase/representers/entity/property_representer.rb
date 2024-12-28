# frozen_string_literal: true

require 'representable/json'
require 'wikibase/model/statement/statement_list'
require 'wikibase/model/term/alias_group_list'
require 'wikibase/model/term/term_list'
require 'wikibase/representers/statement/statement_list_representer'
require 'wikibase/representers/term/alias_group_list_representer'
require 'wikibase/representers/term/term_list_representer'

module Wikibase
  module Representers
    module Entity
      # Representer for Wikibase properties
      class PropertyRepresenter < Representable::Decorator
        include Representable::JSON

        property :type
        property :data_type, as: 'datatype'
        property :id
        property :labels, decorator: Wikibase::Representers::Term::TermListRepresenter,
                          class: Wikibase::Model::Term::TermList
        property :descriptions, decorator: Wikibase::Representers::Term::TermListRepresenter,
                                class: Wikibase::Model::Term::TermList
        property :alias_groups, as: 'aliases', decorator: Wikibase::Representers::Term::AliasGroupListRepresenter,
                                class: Wikibase::Model::Term::AliasGroupList
        property :statements, as: 'claims', decorator: Wikibase::Representers::Statement::StatementListRepresenter,
                              class: Wikibase::Model::Statement::StatementList
      end
    end
  end
end
