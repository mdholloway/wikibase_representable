# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Wraps a hash of Term arrays keyed by language code.
    class AliasGroupList < Hash
      def aliases_for_language(language_code)
        language_code
      end

      def aliases_for_language?(language_code)
        key?(language_code)
      end
    end
  end
end
