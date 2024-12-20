# frozen_string_literal: true

module Wikibase
  module DataModel
    module DataValue
      # Data value representing a string
      class StringValue < DataValue
        TYPE = 'string'

        attr_reader :value

        def initialize(value)
          super(type: TYPE)
          @value = value
        end
      end
    end
  end
end
