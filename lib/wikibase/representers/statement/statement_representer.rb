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
