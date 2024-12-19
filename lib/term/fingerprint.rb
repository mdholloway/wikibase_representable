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

        def label?(language)
          @labels.has_term_for_language(language)
        end

        def get_label(language)
          @labels.get_by_language(language)
        end

        def set_label(language, value)
          @labels.set_term(Term.new(language, value))
        end

        def remove_label(language)
          @labels.remove_by_language(language)
        end

        def description?(language)
          @descriptions.has_term_for_language(language)
        end

        def get_description(language)
          @descriptions.get_by_language(language)
        end

        def set_description(language, value)
          @descriptions.set_term(Term.new(language: language, value: value))
        end

        def remove_description(language)
          @descriptions.remove_by_language(language)
        end

        def alias_group?(language)
          @alias_groups.has_group_for_language(language)
        end

        def get_alias_group(language)
          @alias_groups.get_by_language(language)
        end

        def set_alias_group(language, aliases)
          @alias_groups.set_group(AliasGroup.new(language: language, aliases: aliases))
        end

        def remove_alias_group(language)
          @alias_groups.remove_by_language(language)
        end

        def empty?
          @labels.empty? && @descriptions.empty? && @alias_groups.empty?
        end
      end
    end
  end
end
