# frozen_string_literal: true

module Wikibase
  module DataModel
    # List of Reference objects.
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
