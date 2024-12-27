# frozen_string_literal: true

require 'model/term/alias_group'
require 'representable/json/hash'
require 'serializers/term/alias_group_serializer'

module Wikibase
  module Serializers
    module Term
      # Serializer for a hash of (language_code => alias_group)
      class AliasGroupListSerializer < Representable::Decorator
        include Representable::JSON::Hash
        include Wikibase::DataModel::Term

        values decorator: AliasGroupSerializer, class: AliasGroup
      end
    end
  end
end
