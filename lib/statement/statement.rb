module Wikibase
  module DataModel
    module Statement
      class Statement
        RANK_PREFERRED = 2;
        RANK_NORMAL = 1;
        RANK_DEPRECATED = 0;

        attr_accessor :mainsnak, :qualifiers, :references, :rank, :guid

        def initialize(mainsnak:, qualifiers: SnakList.new, references: ReferenceList.new, rank: RANK_NORMAL, guid: nil)
          @mainsnak = mainsnak
          @qualifiers = qualifiers
          @references = references
          @guid = guid
        end

        def get_property_id
          @mainsnak.property_id
        end
      end
    end
  end
end