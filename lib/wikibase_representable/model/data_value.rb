# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Object that represents a single data value.
    class DataValue
      attr_accessor :type, :value

      def initialize(type: nil, value: nil)
        @type = type
        @value = value
      end

      def state
        [@type, @value]
      end

      def ==(other)
        other.class == self.class && other.state == state
      end

      def eql?(other)
        self == other
      end
    end
  end
end
