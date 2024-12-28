# frozen_string_literal: true

require 'wikibase/model/snak/snak_list'

module Wikibase
  module Model
    module Statement
      # Class representing a Wikibase statement.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Statements
      class Statement
        include Wikibase::Model::Snak

        TYPE = 'statement'

        RANK_PREFERRED = 'preferred'
        RANK_NORMAL = 'normal'
        RANK_DEPRECATED = 'deprecated'

        attr_accessor :type, :main_snak, :qualifiers, :rank, :guid

        def initialize(type: TYPE, main_snak: nil, qualifiers: SnakList.new, rank: RANK_NORMAL,
                       guid: nil)
          @type = type
          @main_snak = main_snak
          @qualifiers = qualifiers
          @rank = rank
          @guid = guid
        end

        def ==(other)
          other.is_a?(self.class) &&
            other.type == type &&
            other.main_snak == main_snak &&
            other.qualifiers == qualifiers &&
            other.rank == rank &&
            other.guid == guid
        end
      end
    end
  end
end
