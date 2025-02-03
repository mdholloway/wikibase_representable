# frozen_string_literal: true

require 'representable/json'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/property_value_snak_representer'
require 'wikibase_representable/representers/snak_hash_representer'

module WikibaseRepresentable
  module Representers
    # Representer for a Wikibase statement (aka claim)
    class StatementRepresenter < Representable::Decorator
      include Representable::JSON
      include WikibaseRepresentable::Model

      property :main_snak, as: 'mainsnak',
                           decorator: PropertyValueSnakRepresenter,
                           class: PropertyValueSnak
      property :type
      property :qualifiers, decorator: SnakHashRepresenter,
                            class: SnakHash
      property :qualifiers_order, as: 'qualifiers-order'
      property :guid, as: 'id'
      property :rank

      collection_representer class: Statement
    end
  end
end
