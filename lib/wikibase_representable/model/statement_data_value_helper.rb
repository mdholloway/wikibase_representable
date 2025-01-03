# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Convenience methods for grabbing values from statements' main snaks
    module StatementDataValueHelper
      def value_type?
        main_snak.data_value.is_a?
      end

      def data_value
        main_snak.data_value.value
      end

      def entity_id_value
        main_snak.data_value.value.id
      end

      def time_value
        main_snak.data_value.value.time
      end
    end
  end
end
