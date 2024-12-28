# frozen_string_literal: true

require 'representable/json'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/alias_group_list_representer'
require 'wikibase_representable/representers/statement_list_representer'
require 'wikibase_representable/representers/term_list_representer'

module WikibaseRepresentable
  module Representers
    # Representer for Wikibase properties
    class PropertyRepresenter < Representable::Decorator
      include Representable::JSON
      include WikibaseRepresentable::Model

      property :type
      property :data_type, as: 'datatype'
      property :id
      property :labels, decorator: TermListRepresenter,
                        class: TermList
      property :descriptions, decorator: TermListRepresenter,
                              class: TermList
      property :alias_groups, as: 'aliases',
                              decorator: AliasGroupListRepresenter,
                              class: AliasGroupList
      property :statements, as: 'claims',
                            decorator: StatementListRepresenter,
                            class: StatementList
    end
  end
end
