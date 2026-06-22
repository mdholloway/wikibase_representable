# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/term_representer'

module WikibaseRepresentable
  module Representers
    # Representer for term hashes
    class TermHashRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      values decorator: TermRepresenter, class: Model::Term
    end
  end
end
