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

      attr_accessor :type, :id, :data_type, :labels_hash, :descriptions_hash, :alias_groups_hash, :statements_hash

      def initialize(**kwargs)
        @type = ENTITY_TYPE
        @data_type = kwargs[:data_type]
        @id = kwargs[:id]
        @labels_hash = kwargs[:labels_hash] || TermHash.new
        @descriptions_hash = kwargs[:descriptions_hash] || TermHash.new
        @alias_groups_hash = kwargs[:alias_groups_hash] || AliasGroupHash.new
        @statements_hash = kwargs[:statements_hash] || StatementHash.new
      end

      def state
        [type, id, data_type, labels_hash, descriptions_hash, alias_groups_hash, statements_hash]
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
