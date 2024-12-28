# frozen_string_literal: true

require 'representable/json'

module WikibaseRepresentable
  module Representers
    # Representer for a term object
    class TermRepresenter < Representable::Decorator
      include Representable::JSON

      property :language_code, as: 'language'
      property :value
    end
  end
end
