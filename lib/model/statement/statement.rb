# frozen_string_literal: true

module Wikibase
  module DataModel
    module Statement
      # Class representing a Wikibase statement.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Statements
      class Statement
        RANK_PREFERRED = 'preferred'
        RANK_NORMAL = 'normal'
        RANK_DEPRECATED = 'deprecated'

        attr_reader :main_snak, :qualifiers, :references, :rank, :guid

        def initialize(main_snak:, qualifiers: SnakList.new, references: ReferenceList.new, rank: RANK_NORMAL,
                       guid: nil)
          @main_snak = main_snak
          @qualifiers = qualifiers
          @references = references
          @rank = rank
          @guid = guid
        end

        def property_id
          @main_snak.property_id
        end
      end
    end
  end
end
