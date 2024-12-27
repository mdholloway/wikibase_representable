# frozen_string_literal: true

module Wikibase
  module DataModel
    module DataValue
      # Object that represents a single data value.
      class DataValue
        attr_accessor :type, :value

        def initialize(type: nil, value: nil)
          @type = type
          @value = value
        end

        def ==(other)
          other.is_a?(self.class) &&
            other.type == type &&
            other.value == value
        end

        def eql?(other)
          self == other
        end
      end
    end
  end
end
