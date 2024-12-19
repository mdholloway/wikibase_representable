# frozen_string_literal: true

module Wikibase
  module DataModel
    # Object that represents a single Wikibase reference.
    # See https://www.mediawiki.org/wiki/Wikibase/DataModel#ReferenceRecords
    class Reference
      def initialize(snaks: [])
        @snaks = snaks
      end

      def empty?
        @snaks.empty?
      end
    end
  end
end
