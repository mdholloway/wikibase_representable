# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Convenience methods for grabbing values from snaks
    module SnakDataValueHelper
      def value_type?(type)
        main_snak.data_value.is_a?(type)
      end

      def entity_id_value
        data_value&.value&.id
      end

      def time_value
        data_value&.value&.time
      end
    end
  end
end
