# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Mixin for objects that have labels; +labels+ is a {WikibaseRepresentable::Model::TermList};
    # including classes should set the instance variable +@labels+.
    module Labelable
      attr_accessor :labels

      # @yieldparam [String] language code; e.g., 'en'
      # @yieldparam [Array<WikibaseRepresentable::Model::Term>] array of labels
      def each_label(&block)
        # despite rubocop's complaint ensure we yield separately args
        labels.each { |code,terms| yield(code, terms) }
      end

      def label(language_code)
        labels.value_for_language(language_code)
      end
    end
  end
end
