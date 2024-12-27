# frozen_string_literal: true

require 'representable/json'

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
