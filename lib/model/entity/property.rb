# frozen_string_literal: true

module Wikibase
  module DataModel
    module Entity
      # Represents a single Wikibase property.
      class Property
        ENTITY_TYPE = 'property'

        attr_reader :id, :data_type, :fingerprint, :statements

        def initialize(id:, data_type:, fingerprint: Fingerprint.new, statements: StatementList.new)
          @id = id
          @fingerprint = fingerprint
          @data_type = data_type
          @statements = statements
        end

        def labels
          @fingerprint.labels
        end

        def descriptions
          @fingerprint.descriptions
        end

        def alias_groups
          @fingerprint.alias_groups
        end

        def set_label(language_code, value)
          @fingerprint.set_label(language_code, value)
        end

        def set_description(language_code, value)
          @fingerprint.set_description(language_code, value)
        end

        def set_aliases(language_code, aliases)
          @fingerprint.set_aliases(language_code, aliases)
        end

        def empty?
          @fingerprint.empty? && @statements.empty?
        end

        def type
          ENTITY_TYPE
        end
      end
    end
  end
end
