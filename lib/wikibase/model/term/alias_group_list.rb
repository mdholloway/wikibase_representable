# frozen_string_literal: true

module Wikibase
  module Model
    module Term
      # Wraps a hash of AliasGroup objects keyed by language code.
      class AliasGroupList
        attr_accessor :alias_groups

        def initialize(alias_groups: {})
          @alias_groups = alias_groups
        end

        def get_by_language(language_code)
          @alias_groups.fetch(language_code)
        end

        def alias_group(alias_group)
          if alias_group.empty?
            @alias_groups.delete(alias_group.language_code)
          else
            @alias_groups[alias_group.language_code] = alias_group
          end
        end

        def remove_by_language(language_code)
          @alias_groups.delete(language_code)
        end

        def group_for_language?(language_code)
          @alias_groups.key?(language_code)
        end

        def aliases_for_language(language_code, aliases)
          alias_groups(AliasGroup.new(language_code: language_code, aliases: aliases))
        end

        def replace(alias_groups)
          AliasGroupList.new(alias_groups: alias_groups)
        end

        def each(&)
          @alias_groups.each(&)
        end

        def ==(other)
          other.is_a?(self.class) &&
            @alias_groups == other.alias_groups
        end

        def eql?(other)
          self == other
        end

        def empty?
          @alias_groups.empty?
        end
      end
    end
  end
end
