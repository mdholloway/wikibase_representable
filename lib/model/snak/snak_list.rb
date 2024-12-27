# frozen_string_literal: true

module Wikibase
  module DataModel
    module Snak
      # List of Snak objects.
      class SnakList
        attr_reader :snaks

        def initialize(snaks: {})
          @snaks = snaks
        end

        def replace(snaks)
          SnakList.new(snaks: snaks)
        end

        def each(&)
          @snaks.each(&)
        end

        def ==(other)
          other.is_a?(self.class) &&
            @snaks == other.snaks
        end

        def eql?(other)
          self == other
        end

        def empty?
          @snaks.empty?
        end
      end
    end
  end
end
