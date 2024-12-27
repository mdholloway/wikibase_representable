# frozen_string_literal: true

require 'model/snak/property_value_snak'
require 'model/snak/snak_list'
require 'representable/json'
require 'representers/snak/property_value_snak_representer'
require 'representers/snak/snak_list_representer'

module Wikibase
  module Representers
    module Statement
      # Representer for a Wikibase statement (aka claim)
      class StatementRepresenter < Representable::Decorator
        include Representable::JSON
        include Wikibase::DataModel::Snak
        include Wikibase::Representers::Snak

        property :main_snak, as: 'mainsnak', decorator: PropertyValueSnakRepresenter, class: PropertyValueSnak
        property :qualifiers, decorator: SnakListRepresenter, class: SnakList
        property :type
        property :guid, as: 'id'
        property :rank

        collection_representer class: Wikibase::DataModel::Statement::Statement
      end
    end
  end
end
