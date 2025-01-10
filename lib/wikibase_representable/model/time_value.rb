# frozen_string_literal: true

require 'wikibase_representable/model/data_value'

module WikibaseRepresentable
  module Model
    # Data value object that represents a time value.
    class TimeValue < DataValue
      TYPE = 'time'

      def initialize(value: nil)
        super(type: TYPE, value: value)
      end

      def time
        @value.time
      end

      def time_zone
        @value.time_zone
      end

      def before
        @value.before
      end

      def after
        @value.after
      end

      def precision
        @value.precision
      end

      def calendar_model
        @value.calendar_model
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
