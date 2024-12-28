# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/term_representer'

module WikibaseRepresentable
  module Representers
    # Representer for term lists
    class TermListRepresenter < Representable::Decorator
      include Representable::JSON::Hash
      include WikibaseRepresentable::Model

      values decorator: TermRepresenter, class: Term
    end
  end
end
