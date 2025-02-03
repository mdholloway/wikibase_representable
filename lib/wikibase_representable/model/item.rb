# frozen_string_literal: true

require 'wikibase_representable/model/alias_group_hash'
require 'wikibase_representable/model/site_link_hash'
require 'wikibase_representable/model/statement_hash'
require 'wikibase_representable/model/term_hash'
require 'wikibase_representable/model/term'

module WikibaseRepresentable
  module Model
    # Represents a single Wikibase item.
    # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Items
    class Item
      ENTITY_TYPE = 'item'

      attr_accessor :type, :id, :labels, :descriptions, :alias_groups, :site_links, :statements

      def initialize(**kwargs)
        @type = ENTITY_TYPE
        @id = kwargs[:id]
        @labels = kwargs[:labels] || TermHash.new
        @descriptions = kwargs[:descriptions] || TermHash.new
        @alias_groups = kwargs[:alias_groups] || AliasGroupHash.new
        @site_links = kwargs[:site_links] || SiteLinkHash.new
        @statements = kwargs[:statements] || StatementHash.new
      end

      def label(language_code)
        labels.value_for_language(language_code)
      end

      def aliases_for_language(language_code)
        alias_groups.aliases_for_language(language_code)
      end

      def statements_by_property_id(property_id)
        statements.statements_by_property_id(property_id)
      end

      def statements_by_property_id?(property_id)
        statements.statements_by_property_id?(property_id)
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

      alias claims statements
      alias claims_by_property_id statements_by_property_id
      alias claims_by_property_id? statements_by_property_id?
    end
  end
end
