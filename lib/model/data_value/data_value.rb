# frozen_string_literal: true

module Wikibase
  module DataModel
    module DataValue
      # Object that represents a single data value.
      class DataValue
        attr_reader :type

        def initialize(type:)
          @type = type
        end
      end
    end
  end
end
