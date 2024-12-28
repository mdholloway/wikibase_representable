# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/alias_group_representer'

module WikibaseRepresentable
  module Representers
    # Representer for a hash of (language_code => alias_group)
    class AliasGroupListRepresenter < Representable::Decorator
      include Representable::JSON::Hash
      include WikibaseRepresentable::Model

      values decorator: AliasGroupRepresenter, class: AliasGroup
    end
  end
end
