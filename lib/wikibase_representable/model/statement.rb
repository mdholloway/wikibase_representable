# frozen_string_literal: true

require 'wikibase_representable/model/snak_list'

module WikibaseRepresentable
  module Model
    # Class representing a Wikibase statement.
    # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Statements
    class Statement
      TYPE = 'statement'

      RANK_PREFERRED = 'preferred'
      RANK_NORMAL = 'normal'
      RANK_DEPRECATED = 'deprecated'

      attr_accessor :main_snak, :type, :qualifiers, :qualifiers_order, :guid, :rank

      def initialize(main_snak: nil,
                     type: TYPE,
                     qualifiers: nil,
                     qualifiers_order: nil,
                     guid: nil,
                     rank: RANK_NORMAL)
        @main_snak = main_snak
        @type = type
        @qualifiers = qualifiers
        @qualifiers_order = qualifiers_order
        @guid = guid
        @rank = rank
      end

      def qualifiers?
        !!qualifiers && !qualifiers.empty?
      end

      def qualifiers_by_property_id?(property_id)
        qualifiers&.snaks_by_property_id?(property_id)
      end

      def qualifiers_by_property_id(property_id)
        qualifiers&.snaks_by_property_id(property_id)
      end

      def qualifier_by_property_id(property_id)
        qualifiers_by_property_id(property_id)&.first
      end

      def property_id
        @main_snak.property_id
      end

      def ==(other)
        other.is_a?(self.class) &&
          other.type == @type &&
          other.main_snak == @main_snak &&
          other.qualifiers == @qualifiers &&
          other.qualifiers_order == @qualifiers_order &&
          other.rank == @rank &&
          other.guid == @guid
      end

      def eql?(other)
        self == other
      end
    end
  end
end
