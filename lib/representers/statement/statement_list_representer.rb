# frozen_string_literal: true

require 'model/statement/statement'
require 'representable/json/hash'
require 'representers/statement/statement_representer'

module Wikibase
  module Representers
    module Statement
      # Representer for a hash of property IDs => statement arrays.
      class StatementListRepresenter < Representable::Decorator
        include Representable::JSON::Hash
        include Wikibase::DataModel::Statement

        values decorator: StatementRepresenter.for_collection, instance: []
      end
    end
  end
end
