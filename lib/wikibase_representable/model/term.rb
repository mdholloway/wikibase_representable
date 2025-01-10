# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Represents a string value specific to a langugage code.
    class Term
      attr_accessor :language_code, :value

      def initialize(language_code: nil, value: nil)
        @language_code = language_code
        @value = value
      end

      def state
        [@language_code, @value]
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
