# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Hash of alias lists keyed by language code.
    class AliasGroupHash < Hash
      def aliases_for_language(language_code)
        fetch(language_code, nil)
      end

      def aliases_for_language?(language_code)
        key?(language_code)
      end
    end
  end
end
