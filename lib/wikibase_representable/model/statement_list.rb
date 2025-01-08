# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Wraps a hash of Statement arrays keyed by entity id.
    class StatementList < Hash
      def statements_by_property_id(property_id)
        fetch(property_id, nil)
      end

      def statements_by_property_id?(property_id)
        key?(property_id)
      end

      alias claims_by_property_id statements_by_property_id
      alias claims_by_property_id? statements_by_property_id?
    end
  end
end
