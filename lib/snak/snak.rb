# frozen_string_literal: true

module Wikibase
  module DataModel
    module Snak
      # Objects that represents a generic Wikibase snak.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Snaks
      class Snak
        attr_reader :property, :hash

        def initialize(property:, hash:)
          @property = property
          @hash = hash
        end
      end
    end
  end
end
