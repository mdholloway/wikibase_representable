module Wikibase
  module DataModel
    module Term
      class AliasGroupList
        def initialize(groups: {})
          @groups = groups
        end

        def get_by_language(language)
          @groups.fetch(language)
        end

        def set_group(group)
          if group.empty?
            @groups.delete(group.language)
          else
            @groups[group.language] = group
          end
        end

        def remove_by_language(language)
          @groups.delete(language)
        end

        def has_group_for_language?(language)
          @groups.has_key?(language)
        end

        def set_aliases_for_language(language, aliases)
          set_group(AliasGroup.new(language_code: language, aliases: aliases))
        end

        def empty?
          @groups.empty?
        end
      end
    end
  end
end
