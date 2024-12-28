# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase/model/term/alias_group'
require 'wikibase/representers/term/alias_group_representer'

module Wikibase
  module Representers
    module Term
      # Representer for a hash of (language_code => alias_group)
      class AliasGroupListRepresenter < Representable::Decorator
        include Representable::JSON::Hash
        include Wikibase::Model::Term

        values decorator: AliasGroupRepresenter, class: AliasGroup
      end
    end
  end
end
