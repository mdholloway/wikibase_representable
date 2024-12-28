# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase/model/term/term'
require 'wikibase/representers/term/term_representer'

module Wikibase
  module Representers
    module Term
      # Representer for term lists
      class TermListRepresenter < Representable::Decorator
        include Representable::JSON::Hash
        include Wikibase::DataModel::Term

        values decorator: TermRepresenter, class: Wikibase::DataModel::Term::Term
      end
    end
  end
end
