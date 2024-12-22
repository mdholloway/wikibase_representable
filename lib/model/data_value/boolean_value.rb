# frozen_string_literal: true

module Wikibase
  module DataModel
    module DataValue
      # Data value representing a boolean
      class BooleanValue < DataValue
        TYPE = 'boolean'

        attr_reader :value

        def initialize(value)
          super(type: TYPE)
          @value = value
        end
      end
    end
  end
end
