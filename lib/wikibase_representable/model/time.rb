# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Represents a point in time.
    class Time
      attr_accessor :time, :time_zone, :before, :after, :precision, :calendar_model

      def initialize(**kwargs)
        @time = kwargs[:time]
        @time_zone = kwargs[:time_zone]
        @before = kwargs[:before]
        @after = kwargs[:after]
        @precision = kwargs[:precision]
        @calendar_model = kwargs[:calendar_model]
      end

      def state
        [time, time_zone, before, after, precision, calendar_model]
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
