# frozen_string_literal: true

require 'representable/json/hash'

module Wikibase
  module Serializers
    module Statement
      # Serializer for a term object
      class StatementListSerializer < Representable::Decorator
        include Representable::JSON::Hash
        
        values decorator: StatementSerializer, class: Statement
      end
    end
  end
end
