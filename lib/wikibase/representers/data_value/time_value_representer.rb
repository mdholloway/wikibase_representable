# frozen_string_literal: true

require 'wikibase/model/data_value/time'

module Wikibase
  module Representers
    module DataValue
      # Represents a time value object
      class TimeValueRepresenter < Representable::Decorator
        include Representable::JSON

        property :value, decorator: TimeRepresenter, class: Wikibase::Model::DataValue::Time
        property :type
      end
    end
  end
end
