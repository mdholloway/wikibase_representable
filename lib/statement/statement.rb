# frozen_string_literal: true

module Wikibase
  module DataModel
    module Statement
      # Class representing a Wikibase statement.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Statements
      class Statement
        RANK_PREFERRED = 2
        RANK_NORMAL = 1
        RANK_DEPRECATED = 0

        attr_reader :mainsnak, :qualifiers, :references, :rank, :guid

        def initialize(mainsnak:, qualifiers: SnakList.new, references: ReferenceList.new, rank: RANK_NORMAL, guid: nil)
          @mainsnak = mainsnak
          @qualifiers = qualifiers
          @references = references
          @rank = rank
          @guid = guid
        end

        def property_id
          @mainsnak.property_id
        end
      end
    end
  end
end
