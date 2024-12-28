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

      attr_accessor :type, :main_snak, :qualifiers, :qualifiers_order, :guid, :rank

      def initialize(type: TYPE,
                     main_snak: nil,
                     qualifiers: SnakList.new,
                     qualifiers_order: nil,
                     guid: nil,
                     rank: RANK_NORMAL)
        @type = type
        @main_snak = main_snak
        @qualifiers = qualifiers
        @qualifiers_order = qualifiers_order
        @rank = rank
        @guid = guid
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
