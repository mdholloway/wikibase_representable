# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase_representable/representers/statement_representer'

module WikibaseRepresentable
  module Representers
    # Representer for a hash of property IDs => statement arrays.
    class StatementHashRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      values decorator: StatementRepresenter.for_collection, instance: ->(_fragment) { [] }
    end
  end
end
