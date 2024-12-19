# frozen_string_literal: true

module Wikibase
  module DataModel
    module Entity
      # Represents a single Wikibase item.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Items
      class Item
        ENTITY_TYPE = 'item'

        attr_reader :id, :fingerprint, :sitelinks, :statements

        def initialize(id:, fingerprint: Fingerprint.new, sitelinks: SiteLinkList.new, statements: StatementList.new)
          @id = id
          @fingerprint = fingerprint
          @sitelinks = sitelinks
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

        def add_site_link(site_link)
          @sitelinks.add_site_link(site_link)
        end

        def remove_site_link(site_id)
          @sitelinks.remove_site_link_with_site_id(site_id)
        end

        def get_site_link(site_id)
          @sitelinks.get_by_site_id(site_id)
        end

        def link_to_site?(site_id)
          @sitelinks.has_link_with_site_id?(site_id)
        end

        def empty?
          @fingerprint.empty? && @sitelinks.empty? && @statements.empty?
        end

        def type
          ENTITY_TYPE
        end
      end
    end
  end
end
