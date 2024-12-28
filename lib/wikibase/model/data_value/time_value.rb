# frozen_string_literal: true

require 'wikibase/model/data_value/data_value'

module Wikibase
  module Model
    module DataValue
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

        def ==(other)
          other.is_a?(self.class) &&
            type == other.type &&
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
