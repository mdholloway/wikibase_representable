# frozen_string_literal: true

require 'representable/json'

module WikibaseRepresentable
  module Representers
    # Representer for data values
    class DataValueRepresenter < Representable::Decorator
      include Representable::JSON

      property :value
      property :type
    end
  end
end
