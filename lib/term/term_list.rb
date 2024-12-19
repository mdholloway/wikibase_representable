module Wikibase
  module DataModel
    module Term
      class TermList
        def initialize(terms: {})
          @terms = terms
        end

        def get_by_language(language)
          @terms.fetch(language)
        end

        def set_term(term)
          if term.text == ''
            @terms.delete(language)
          else
            @terms[term.language] = term
          end
        end

        def remove_by_language(language)
          @terms.delete(language)
        end

        def has_term_for_language?(language)
          @terms.has_key?(language)
        end

        def set_text_for_language(language, value)
          set_term(Term.new(language, value))
        end

        def empty?
          @terms.empty?
        end
      end
    end
  end
end
