# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Object representing a list of aliases of an entity in a given language.
    class AliasGroup
      attr_accessor :language_code, :aliases

      def initialize(language_code: nil, aliases: [])
        @language_code = language_code
        @aliases = aliases
      end

      def empty?
        @aliases.empty?
      end

      def ==(other)
        other.is_a?(self.class) &&
          @language_code == other.language_code &&
          @aliases & other.aliases == @aliases
      end

      def eql?(other)
        self == other
      end
    end
  end
end
