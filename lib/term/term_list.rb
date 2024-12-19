# frozen_string_literal: true

module Wikibase
  module DataModel
    module Term
      #  Hash of Term objects keyed by language code.
      class TermList
        def initialize(terms: {})
          @terms = terms
        end

        def get_by_language(language)
          @terms.fetch(language)
        end

        def term(term)
          if term.text == ''
            @terms.delete(language)
          else
            @terms[term.language] = term
          end
        end

        def remove_by_language(language)
          @terms.delete(language)
        end

        def term_for_language?(language)
          @terms.key?(language)
        end

        def text_for_language(language, value)
          term(Term.new(language, value))
        end

        def empty?
          @terms.empty?
        end
      end
    end
  end
end
