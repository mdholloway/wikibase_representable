# frozen_string_literal: true

require 'representable/json'
require 'wikibase_representable/model'

module WikibaseRepresentable
  module Representers
    # Representer for a term object
    class TermRepresenter < Representable::Decorator
      include Representable::JSON
      include WikibaseRepresentable::Model

      property :language_code, as: 'language'
      property :value

      collection_representer class: Term
    end
  end
end
