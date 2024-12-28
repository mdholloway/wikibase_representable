# frozen_string_literal: true

require 'representable/json'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/term_representer'

module WikibaseRepresentable
  module Representers
    # Representer for an alias group
    class AliasGroupRepresenter < Representable::Decorator
      include Representable::JSON
      include WikibaseRepresentable::Model

      property :language_code, as: 'language'
      collection :aliases, decorator: TermRepresenter, class: Model::Term
    end
  end
end
