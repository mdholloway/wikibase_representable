# frozen_string_literal: true

require 'model/term/term'
require 'representable/json/hash'
require 'serializers/term/term_serializer'

module Wikibase
  module Serializers
    module Term
      # Serializer for term lists
      class TermListSerializer < Representable::Decorator
        include Representable::JSON::Hash
        include Wikibase::DataModel::Term

        values decorator: TermSerializer, class: Wikibase::DataModel::Term::Term
      end
    end
  end
end
