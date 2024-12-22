# frozen_string_literal: true

require 'representable/json/hash'

module Wikibase
  module Serializers
    module Term
      # Serializer for a hash of (language_code => alias_group)
      class AliasGroupListSerializer < Representable::Decorator
        include Representable::JSON::Hash
        
        values decorator: AliasGroupSerializer, class: AliasGroup
      end
    end
  end
end
