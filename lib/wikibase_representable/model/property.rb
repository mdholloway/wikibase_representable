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

      def initialize(type: ENTITY_TYPE,
                     id: nil,
                     data_type: nil,
                     labels: TermList.new,
                     descriptions: TermList.new,
                     alias_groups: AliasGroupList.new,
                     statements: StatementList.new)
        @type = type
        @data_type = data_type
        @id = id
        @labels = labels
        @descriptions = descriptions
        @alias_groups = alias_groups
        @statements = statements
      end

      def set_label(language_code, value)
        @labels.term(Term.new(language_code, value))
      end

      def set_description(language_code, value)
        @descriptions.term(Term.new(language_code, value))
      end

      def set_aliases(language_code, aliases)
        @alias_groups.aliases_for_language(language_code, aliases)
      end

      def empty?
        @labels.empty? && @descriptions.empty? && @alias_groups.empty? && @statements.empty?
      end

      def ==(other)
        other.is_a?(self.class) &&
          @type == other.type &&
          @id == other.id &&
          @data_type == other.data_type &&
          @labels == other.labels &&
          @descriptions == other.descriptions &&
          @alias_groups == other.alias_groups &&
          @statements == other.statements
      end

      def eql?(other)
        self == other
      end
    end
  end
end
