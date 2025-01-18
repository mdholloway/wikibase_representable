# frozen_string_literal: true

require 'wikibase_representable/model/snak_list'

module WikibaseRepresentable
  module Model
    # Class representing a Wikibase statement.
    # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Statements
    class Statement
      include StatementDataValueHelper

      TYPE = 'statement'

      RANK_PREFERRED = 'preferred'
      RANK_NORMAL = 'normal'
      RANK_DEPRECATED = 'deprecated'

      attr_accessor :main_snak, :type, :qualifiers, :qualifiers_order, :guid, :rank

      def initialize(**kwargs)
        @main_snak = kwargs[:main_snak]
        @type = kwargs[:type] || TYPE
        @qualifiers = kwargs[:qualifiers]
        @qualifiers_order = kwargs[:qualifiers_order]
        @guid = kwargs[:guid]
        @rank = kwargs[:rank] || RANK_NORMAL
      end

      def qualifiers_by_property_id?(property_id)
        qualifiers&.snaks_by_property_id?(property_id)
      end

      def qualifiers_by_property_id(property_id)
        qualifiers&.snaks_by_property_id(property_id)
      end

      def property_id
        main_snak.property_id
      end

      def state
        [main_snak, type, qualifiers, qualifiers_order, guid, rank]
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
