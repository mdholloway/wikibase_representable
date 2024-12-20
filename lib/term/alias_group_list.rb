# frozen_string_literal: true

module Wikibase
  module DataModel
    module Term
      # Hash of AliasGroup objects keyed by language code.
      class AliasGroupList
        def initialize(groups: {})
          @groups = groups
        end

        def get_by_language(language_code)
          @groups.fetch(language_code)
        end

        def group(group)
          if group.empty?
            @groups.delete(group.language_code)
          else
            @groups[group.language_code] = group
          end
        end

        def remove_by_language(language_code)
          @groups.delete(language_code)
        end

        def group_for_language?(language_code)
          @groups.key?(language_code)
        end

        def aliases_for_language(language_code, aliases)
          set_group(AliasGroup.new(language_code: language_code, aliases: aliases))
        end

        def empty?
          @groups.empty?
        end
      end
    end
  end
end
