module Wikibase
  module DataModel
    module Statement
      class StatementList
        def initialize(statements: [])
          @statements = statements
        end
      end
    end
  end
end