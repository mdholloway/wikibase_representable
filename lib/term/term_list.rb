# frozen_string_literal: true

module Wikibase
  module DataModel
    module Term
      #  Hash of Term objects keyed by language code.
      class TermList
        def initialize(terms: {})
          @terms = terms
        end

        def get_by_language(language_code)
          @terms.fetch(language_code)
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

        def empty?
          @terms.empty?
        end
      end
    end
  end
end
