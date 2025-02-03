# frozen_string_literal: true

require 'wikibase_representable/model/alias_group_hash'
require 'wikibase_representable/model/statement_hash'
require 'wikibase_representable/model/term_hash'
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
        @labels = kwargs[:labels] || TermHash.new
        @descriptions = kwargs[:descriptions] || TermHash.new
        @alias_groups = kwargs[:alias_groups] || AliasGroupHash.new
        @statements = kwargs[:statements] || StatementHash.new
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
