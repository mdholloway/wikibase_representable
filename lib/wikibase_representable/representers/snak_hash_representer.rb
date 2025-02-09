# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase_representable/representers/property_value_snak_representer'

module WikibaseRepresentable
  module Representers
    # Representer for a hash of snak lists keyed by property ID.
    class SnakHashRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      values decorator: PropertyValueSnakRepresenter.for_collection, instance: ->(_fragment) { [] }
    end
  end
end
