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
        include Wikibase::DataModel::Statement
        include Wikibase::DataModel::Term
        include Wikibase::Representers::Statement
        include Wikibase::Representers::Term

        property :type
        property :data_type, as: 'datatype'
        property :id
        property :labels, decorator: TermListRepresenter, class: TermList
        property :descriptions, decorator: TermListRepresenter, class: TermList
        property :alias_groups, as: 'aliases', decorator: AliasGroupListRepresenter, class: AliasGroupList
        property :statements, as: 'claims', decorator: StatementListRepresenter, class: StatementList
      end
    end
  end
end
