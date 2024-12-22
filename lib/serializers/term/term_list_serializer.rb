# frozen_string_literal: true

require 'representable/json/hash'

module Wikibase
  module Serializers
    module Term
      # Serializer for a hash of (language_code => term)
      class TermListSerializer < Representable::Decorator
        include Representable::JSON::Hash

        values decorator: TermSerializer, class: Term
      end
    end
  end
end
