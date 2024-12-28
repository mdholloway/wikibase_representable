# frozen_string_literal: true

require 'representable/json'

module WikibaseRepresentable
  module Representers
    # Representer for time objects
    class TimeRepresenter < Representable::Decorator
      include Representable::JSON

      property :time
      property :time_zone, as: 'timezone'
      property :before
      property :after
      property :precision
      property :calendar_model, as: 'calendarmodel'
    end
  end
end
