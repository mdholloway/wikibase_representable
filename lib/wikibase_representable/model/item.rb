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

      attr_accessor :type, :id, :labels_hash, :descriptions_hash, :alias_groups_hash, :site_links_hash, :statements_hash

      def initialize(**kwargs)
        @type = ENTITY_TYPE
        @id = kwargs[:id]
        @labels_hash = kwargs[:labels_hash] || TermHash.new
        @descriptions_hash = kwargs[:descriptions_hash] || TermHash.new
        @alias_groups_hash = kwargs[:alias_groups_hash] || AliasGroupHash.new
        @site_links_hash = kwargs[:site_links_hash] || SiteLinkHash.new
        @statements_hash = kwargs[:statements_hash] || StatementHash.new
      end

      def label(language_code)
        labels_hash.value_for_language(language_code)
      end

      def aliases_for_language(language_code)
        alias_groups_hash.aliases_for_language(language_code)
      end

      def statements_by_property_id(property_id)
        statements_hash.statements_by_property_id(property_id)
      end

      def statements_by_property_id?(property_id)
        statements_hash.statements_by_property_id?(property_id)
      end

      def site_link(site_id)
        site_links_hash.link_for_site(site_id)
      end

      def link_to_site?(site_id)
        site_links_hash.link_for_site?(site_id)
      end

      def state
        [type, id, labels_hash, descriptions_hash, alias_groups_hash, site_links_hash, statements_hash]
      end

      def ==(other)
        other.class == self.class && other.state == state
      end

      def eql?(other)
        self == other
      end

      alias claims_hash statements_hash
      alias claims_by_property_id statements_by_property_id
      alias claims_by_property_id? statements_by_property_id?
    end
  end
end
