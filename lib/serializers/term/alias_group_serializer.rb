# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Serializers
    module Term
      # Serializer for an alias group
      class AliasGroupSerializer < Representable::Decorator
        include Representable::JSON

        property :language
        collection :aliases
      end
    end
  end
end
