# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase_representable/representers/term_representer'

module WikibaseRepresentable
  module Representers
    # Representer for a hash of language_codes => term arrays
    class AliasGroupListRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      values decorator: TermRepresenter.for_collection, instance: ->(_fragment) { [] }
    end
  end
end
