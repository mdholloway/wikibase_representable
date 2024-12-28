# frozen_string_literal: true

require 'representable/json'
require 'wikibase/model/snak/property_value_snak'
require 'wikibase/model/snak/snak_list'
require 'wikibase/representers/snak/property_value_snak_representer'
require 'wikibase/representers/snak/snak_list_representer'

module Wikibase
  module Representers
    module Statement
      # Representer for a Wikibase statement (aka claim)
      class StatementRepresenter < Representable::Decorator
        include Representable::JSON

        property :main_snak, as: 'mainsnak', decorator: Wikibase::Representers::Snak::PropertyValueSnakRepresenter,
                             class: Wikibase::Model::Snak::PropertyValueSnak
        property :qualifiers, decorator: Wikibase::Representers::Snak::SnakListRepresenter,
                              class: Wikibase::Model::Snak::SnakList
        property :type
        property :guid, as: 'id'
        property :rank

        collection_representer class: Wikibase::Model::Statement::Statement
      end
    end
  end
end
