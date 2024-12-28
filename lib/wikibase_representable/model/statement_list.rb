# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Wraps a hash of Statement arrays keyed by entity id.
    class StatementList
      attr_accessor :statements

      def initialize(statements: {})
        @statements = statements
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
    end
  end
end