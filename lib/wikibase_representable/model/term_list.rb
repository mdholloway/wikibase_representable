# frozen_string_literal: true

require 'wikibase_representable/model/term'

module WikibaseRepresentable
  module Model
    # Wraps a hash of Term objects keyed by language code.
    class TermList
      attr_accessor :terms

      def initialize(terms: {})
        @terms = terms
      end

      def get_by_language(language_code)
        @terms[language_code]
      end

      def term(term)
        if term.text == ''
          @terms.delete(language_code)
        else
          @terms[term.language_code] = term
        end
      end

      def remove_by_language(language_code)
        @terms.delete(language_code)
      end

      def term_for_language?(language_code)
        @terms.key?(language_code)
      end

      def text_for_language(language_code, value)
        term(Term.new(language_code, value))
      end

      def replace(terms)
        TermList.new(terms: terms)
      end

      def each(&)
        @terms.each(&)
      end

      def ==(other)
        other.is_a?(self.class) &&
          @terms == other.terms
      end

      def eql?(other)
        self == other
      end

      def empty?
        @terms.empty?
      end
    end
  end
end
