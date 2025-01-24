# frozen_string_literal: true

require 'wikibase_representable/model/alias_group_list'
require 'wikibase_representable/model/site_link_list'
require 'wikibase_representable/model/statement_list'
require 'wikibase_representable/model/term_list'
require 'wikibase_representable/model/term'
require_relative './claimable'
require_relative './labelable'

module WikibaseRepresentable
  module Model
    # Represents a single Wikibase item.
    # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Items
    class Item
      include Claimable
      include Labelable

      ENTITY_TYPE = 'item'

      attr_accessor :type, :id, :descriptions, :alias_groups, :site_links

      def initialize(**kwargs)
        @type = ENTITY_TYPE
        @id = kwargs[:id]
        @labels = kwargs[:labels] || TermList.new
        @descriptions = kwargs[:descriptions] || TermList.new
        @alias_groups = kwargs[:alias_groups] || AliasGroupList.new
        @site_links = kwargs[:site_links] || SiteLinkList.new
        @statements = kwargs[:statements] || StatementList.new
      end

      def aliases_for_language(language_code)
        alias_groups.aliases_for_language(language_code)
      end

      def site_link(site_id)
        site_links.link_for_site(site_id)
      end

      def link_to_site?(site_id)
        site_links.link_for_site?(site_id)
      end

      def state
        [type, id, labels, descriptions, alias_groups, site_links, statements]
      end

      def ==(other)
        other.class == self.class && other.state == state
      end

      def eql?(other)
        self == other
      end
    end
  end
end
