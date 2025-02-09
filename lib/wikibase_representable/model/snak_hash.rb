# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Hash of Snak lists keyed by property ID
    class SnakHash < Hash
      def snaks_by_property_id(property_id)
        fetch(property_id, nil)
      end

      def snaks_by_property_id?(property_id)
        key?(property_id)
      end
    end
  end
end
