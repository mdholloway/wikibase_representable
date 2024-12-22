# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Serializers
    module Term
      # Serializer for a term object
      class TermSerializer < Representable::Decorator
        include Representable::JSON
        
        property :language
        property :value
      end
    end
  end
end
