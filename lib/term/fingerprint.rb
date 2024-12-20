# frozen_string_literal: true

module Wikibase
  module DataModel
    module Term
      # A container for all labels, all descriptions and all aliases (in all languages) of entities that
      # support all three term types. Should not be used for entity types that only support one or two of
      # these term types.
      class Fingerprint
        attr_reader :labels, :descriptions, :alias_groups

        def initialize(labels: TermList.new, descriptions: TermList.new, alias_groups: AliasGroupList.new)
          @labels = labels
          @descriptions = descriptions
          @alias_groups = alias_groups
        end

        def label?(language_code)
          @labels.has_term_for_language(language_code)
        end

        def get_label(language_code)
          @labels.get_by_language(language_code)
        end

        def set_label(language_code, value)
          @labels.set_term(Term.new(language_code, value))
        end

        def remove_label(language_code)
          @labels.remove_by_language(language_code)
        end

        def description?(language_code)
          @descriptions.has_term_for_language(language_code)
        end

        def get_description(language_code)
          @descriptions.get_by_language(language_code)
        end

        def set_description(language_code, value)
          @descriptions.set_term(Term.new(language_code: language_code, value: value))
        end

        def remove_description(language_code)
          @descriptions.remove_by_language(language_code)
        end

        def alias_group?(language_code)
          @alias_groups.has_group_for_language(language_code)
        end

        def get_alias_group(language_code)
          @alias_groups.get_by_language(language_code)
        end

        def set_alias_group(language_code, aliases)
          @alias_groups.set_group(AliasGroup.new(language_code: language_code, aliases: aliases))
        end

        def remove_alias_group(language_code)
          @alias_groups.remove_by_language(language_code)
        end

        def empty?
          @labels.empty? && @descriptions.empty? && @alias_groups.empty?
        end
      end
    end
  end
end
