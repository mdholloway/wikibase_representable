# frozen_string_literal: true

require 'representable/json'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/alias_group_hash_representer'
require 'wikibase_representable/representers/statement_hash_representer'
require 'wikibase_representable/representers/term_hash_representer'

module WikibaseRepresentable
  module Representers
    # Representer for Wikibase properties
    class PropertyRepresenter < Representable::Decorator
      include Representable::JSON
      include WikibaseRepresentable::Model

      property :type
      property :data_type, as: 'datatype'
      property :id
      property :labels_hash, as: 'labels',
                             decorator: TermHashRepresenter,
                             class: TermHash
      property :descriptions_hash, as: 'descriptions',
                                   decorator: TermHashRepresenter,
                                   class: TermHash
      property :alias_groups_hash, as: 'aliases',
                                   decorator: AliasGroupHashRepresenter,
                                   class: AliasGroupHash
      property :statements_hash, as: 'claims',
                                 decorator: StatementHashRepresenter,
                                 class: StatementHash
    end
  end
end
