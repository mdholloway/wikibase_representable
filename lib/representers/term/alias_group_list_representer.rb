# frozen_string_literal: true

require 'model/term/alias_group'
require 'representable/json/hash'
require 'representers/term/alias_group_representer'

module Wikibase
  module Representers
    module Term
      # Representer for a hash of (language_code => alias_group)
      class AliasGroupListRepresenter < Representable::Decorator
        include Representable::JSON::Hash
        include Wikibase::DataModel::Term

        values decorator: AliasGroupRepresenter, class: AliasGroup
      end
    end
  end
end
