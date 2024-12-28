# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase/model/snak/property_value_snak'
require 'wikibase/representers/snak/property_value_snak_representer'

module Wikibase
  module Representers
    module Snak
      # Representer for a list of property value snaks.
      class SnakListRepresenter < Representable::Decorator
        include Representable::JSON::Hash
        include Wikibase::Model::Snak

        values decorator: PropertyValueSnakRepresenter, class: PropertyValueSnak
      end
    end
  end
end
