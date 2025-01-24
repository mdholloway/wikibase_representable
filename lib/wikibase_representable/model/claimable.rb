# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Mixin for objects that have labels; +statements+ is a {WikibaseRepresentable::Model::StatementList};
    # including classes should set the instance variable +@statements+.
    module Claimable
      attr_accessor :statements

      # @yieldparam [String] property_id
      # @yieldparam [Array<WikibaseRepresentable::Model::Statement>] array of statements
      def each_statement(&block)
        # despite rubocop's complaint ensure we yield separately args
        statements.each { |prop,stmts| yield(prop, stmts) }
      end

      def statements_by_property_id(property_id)
        statements.statements_by_property_id(property_id)
      end

      def statements_by_property_id?(property_id)
        statements.statements_by_property_id?(property_id)
      end

      alias claims statements
      alias claims_by_property_id statements_by_property_id
      alias claims_by_property_id? statements_by_property_id?
    end
  end
end
