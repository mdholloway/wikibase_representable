# frozen_string_literal: true

require 'wikibase_representable/model/alias_group_list'
require 'wikibase_representable/model/statement_list'
require 'wikibase_representable/model/term_list'
require 'wikibase_representable/model/term'

module WikibaseRepresentable
  module Model
    # Represents a single Wikibase property.
    class Property
      ENTITY_TYPE = 'property'

      attr_accessor :type, :id, :data_type, :labels, :descriptions, :alias_groups, :statements

      def initialize(**kwargs)
        @type = ENTITY_TYPE
        @data_type = kwargs[:data_type]
        @id = kwargs[:id]
        @labels = kwargs[:labels] || TermList.new
        @descriptions = kwargs[:descriptions] || TermList.new
        @alias_groups = kwargs[:alias_groups] || AliasGroupList.new
        @statements = kwargs[:statements] || StatementList.new
      end

      def label(language_code, value)
        labels.term(Term.new(language_code, value))
      end

      def description(language_code, value)
        descriptions.term(Term.new(language_code, value))
      end

      def aliases(language_code, aliases)
        alias_groups.aliases_for_language(language_code, aliases)
      end

      def empty?
        labels.empty? && descriptions.empty? && alias_groups.empty? && statements.empty?
      end

      def state
        [type, id, data_type, labels, descriptions, alias_groups, statements]
      end

      def ==(other)
        other.class == self.class && other.state == state
      end

      def eql?(other)
        self == other
      end
    end
  end
end
