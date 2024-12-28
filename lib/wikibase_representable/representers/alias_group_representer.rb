# frozen_string_literal: true

require 'representable/json'

module WikibaseRepresentable
  module Representers
    # Representer for an alias group
    class AliasGroupRepresenter < Representable::Decorator
      include Representable::JSON

      property :language_code, as: 'language'
      collection :aliases
    end
  end
end
