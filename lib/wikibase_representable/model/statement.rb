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

      attr_accessor :main_snak, :qualifiers, :qualifiers_order, :type, :guid, :rank

      def initialize(type: TYPE,
                     main_snak: nil,
                     qualifiers: nil,
                     qualifiers_order: nil,
                     guid: nil,
                     rank: RANK_NORMAL)
        @main_snak = main_snak
        @qualifiers = qualifiers
        @qualifiers_order = qualifiers_order
        @type = type
        @guid = guid
        @rank = rank
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
