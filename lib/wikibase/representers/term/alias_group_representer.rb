# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Representers
    module Term
      # Representer for an alias group
      class AliasGroupRepresenter < Representable::Decorator
        include Representable::JSON

        property :language_code, as: 'language'
        collection :aliases
      end
    end
  end
end
