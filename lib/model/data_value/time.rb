# frozen_string_literal: true

module Wikibase
  module DataModel
    module DataValue
      # Represents a point in time.
      class Time
        attr_accessor :time, :time_zone, :before, :after, :precision, :calendar_model

        def initialize(time: nil, time_zone: nil, before: nil, after: nil, precision: nil, calendar_model: nil)
          @time = time
          @time_zone = time_zone
          @before = before
          @after = after
          @precision = precision
          @calendar_model = calendar_model
        end

        def ==(other)
          other.is_a?(self.class) &&
            time == other.time &&
            time_zone == other.time_zone &&
            before == other.before &&
            after == other.after &&
            precision == other.precision &&
            calendar_model == other.calendar_model
        end

        def eql?(other)
          self == other
        end
      end
    end
  end
end
