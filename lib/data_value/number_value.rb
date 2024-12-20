# frozen_string_literal: true

module Wikibase
  module DataModel
    module DataValue
      # Data value representing a number
      class NumberValue < DataValue
        TYPE = 'number'

        attr_reader :value

        def initialize(value)
          super(type: TYPE)
          @value = value
        end
      end
    end
  end
end
