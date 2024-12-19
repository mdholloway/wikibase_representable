module Wikibase
  module DataModel
    class ReferenceList
      def initialize(references: [])
        @references = references
      end

      def empty?
        @references.empty?
      end
    end
  end
end