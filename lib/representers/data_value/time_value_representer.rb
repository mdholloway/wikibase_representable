# frozen_string_literal: true

require 'model/data_value/data_value'

module Wikibase
  module Representers
    module DataValue
      # Represents a time value object
      class TimeValueRepresenter < Representable::Decorator
        include Representable::JSON
        include Wikibase::DataModel::DataValue

        property :value, decorator: TimeRepresenter, class: Time
        property :type
      end
    end
  end
end
