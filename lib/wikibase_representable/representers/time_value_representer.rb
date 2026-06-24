# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/time_representer'

module WikibaseRepresentable
  module Representers
    # Represents a time value object
    class TimeValueRepresenter < Representable::Decorator
      include Representable::JSON

      property :value, decorator: TimeRepresenter, class: Model::Time
      property :type
    end
  end
end
