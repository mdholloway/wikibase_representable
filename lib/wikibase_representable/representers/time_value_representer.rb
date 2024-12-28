# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/time_representer'

module WikibaseRepresentable
  module Representers
    # Represents a time value object
    class TimeValueRepresenter < Representable::Decorator
      include Representable::JSON
      include WikibaseRepresentable::Model

      property :value, decorator: TimeRepresenter, class: Time
      property :type
    end
  end
end
