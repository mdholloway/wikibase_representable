module Wikibase
  module DataModel
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
