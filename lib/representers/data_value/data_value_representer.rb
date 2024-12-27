# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Representers
    module DataValue
      # Representer for data values
      class DataValueRepresenter < Representable::Decorator
        include Representable::JSON

        property :value
        property :type
      end
    end
  end
end
