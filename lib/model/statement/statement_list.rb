# frozen_string_literal: true

module Wikibase
  module DataModel
    module Statement
      # Ordered and non-unique collection of Statement objects.
      class StatementList
        def initialize(statements: [])
          @statements = statements
        end
      end
    end
  end
end
