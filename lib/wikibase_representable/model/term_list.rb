# frozen_string_literal: true

require 'wikibase_representable/model/term'

module WikibaseRepresentable
  module Model
    # Wraps a hash of Term objects keyed by language code.
    class TermList < Hash
      def term_for_language(language_code)
        fetch(language_code, nil)
      end

      def value_for_language(language_code)
        term_for_language(language_code)&.value
      end

      def term_for_language?(language_code)
        key?(language_code)
      end
    end
  end
end
