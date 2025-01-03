# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Wraps a hash of Statement arrays keyed by entity id.
    class StatementList
      attr_accessor :statements

      def initialize(statements: {})
        @statements = statements
      end

      def statements_by_property_id(property_id)
        @statements[property_id]
      end

      def statements_by_property_id?(property_id)
        @statements.key?(property_id)
      end

      def statement_by_property_id(property_id)
        statements_for_property_id(property_id)&.first
      end

      def each(&)
        @statements.each(&)
      end

      def replace(statements)
        StatementList.new(statements: statements)
      end

      def ==(other)
        other.is_a?(self.class) &&
          @statements == other.statements
      end

      def eql?(other)
        self == other
      end

      def empty?
        @statements.empty?
      end

      alias claims statements
      alias claims_by_property_id statements_by_property_id
      alias claims_by_property_id? statements_by_property_id?
      alias claim_by_property_id statement_by_property_id
    end
  end
end
