# frozen_string_literal: true

require 'wikibase_representable/model/alias_group_list'
require 'wikibase_representable/model/site_link_list'
require 'wikibase_representable/model/statement_list'
require 'wikibase_representable/model/term_list'
require 'wikibase_representable/model/term'

module WikibaseRepresentable
  module Model
    # Represents a single Wikibase item.
    # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Items
    class Item
      ENTITY_TYPE = 'item'

      attr_accessor :type, :id, :labels, :descriptions, :alias_groups, :site_links, :statements

      def initialize(type: ENTITY_TYPE,
                     id: nil,
                     labels: TermList.new,
                     descriptions: TermList.new,
                     alias_groups: AliasGroupList.new,
                     site_links: SiteLinkList.new,
                     statements: StatementList.new)
        @type = type
        @id = id
        @labels = labels
        @descriptions = descriptions
        @alias_groups = alias_groups
        @site_links = site_links
        @statements = statements
      end

      def label(language_code)
        @labels.value_for_language(language_code)
      end

      def statements_for_property_id(property_id)
        @statements.statements_for_property_id(property_id)
      end

      def statements_for_property_id?(property_id)
        @statements.statements_for_property_id?(property_id)
      end

      def statement_for_property_id(property_id)
        @statements.statements_for_property_id(property_id)&.first
      end

      def site_link(site_id)
        @site_links.link_for_site(site_id)
      end

      def link_to_site?(site_id)
        @site_links.link_for_site?(site_id)
      end

      def empty?
        @labels.empty? && @descriptions.empty? && @alias_groups.empty? && @site_links.empty? && @statements.empty?
      end

      def ==(other)
        other.is_a?(self.class) &&
          @type == other.type &&
          @id == other.id &&
          @labels == other.labels &&
          @descriptions == other.descriptions &&
          @alias_groups == other.alias_groups &&
          @site_links == other.site_links &&
          @statements == other.statements
      end

      def eql?(other)
        self == other
      end

      alias claims statements
      alias claims_for_property_id statements_for_property_id
      alias claims_for_property_id? statements_for_property_id?
      alias claim_for_property_id statement_for_property_id
    end
  end
end
