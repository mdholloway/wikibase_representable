# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/property_value_snak_representer'

module WikibaseRepresentable
  module Representers
    # Representer for a list of property value snaks.
    class SnakListRepresenter < Representable::Decorator
      include Representable::JSON::Hash
      include WikibaseRepresentable::Model

      values decorator: PropertyValueSnakRepresenter, class: PropertyValueSnak
    end
  end
end
