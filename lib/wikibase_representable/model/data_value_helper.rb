# frozen_string_literal: true

module DigitalScriptorium
  module Model
    # Convenience methods for grabbing values from statements' main snaks
    module DataValueHelper
      def value_from(statement)
        statement&.main_snak&.data_value
      end

      def data_value_from(statement)
        statement&.main_snak&.data_value&.value
      end

      def entity_id_value_from(statement)
        statement&.main_snak&.data_value&.value&.id
      end

      def time_value_from(statement)
        statement&.main_snak&.data_value&.value&.time
      end
    end
  end
end
