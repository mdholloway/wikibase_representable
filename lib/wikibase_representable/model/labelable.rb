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
        labels.each(&block)
      end

      def label(language_code)
        labels.value_for_language(language_code)
      end
    end
  end
end
