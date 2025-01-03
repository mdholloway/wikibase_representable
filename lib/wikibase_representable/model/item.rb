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

      def get_label_by_language(language_code)
        @labels.get_by_language(language_code)
      end

      def get_statements_by_property_id(property_id)
        @statements.get_by_property_id(property_id)
      end

      def get_claims_by_property_id(property_id)
        @statements.get_by_property_id(property_id)
      end

      def set_label(language_code, value)
        @labels.term(Term.new(language_code, value))
      end

      def set_description(language_code, value)
        @descriptions.term(Term.new(language_code, value))
      end

      def set_aliases(language_code, aliases)
        @alias_groups.aliases_for_language(language_code, aliases)
      end

      def add_site_link(site_link)
        @site_links.add_site_link(site_link)
      end

      def remove_site_link(site_id)
        @site_links.remove_site_link_with_site_id(site_id)
      end

      def get_site_link(site_id)
        @site_links.get_by_site_id(site_id)
      end

      def link_to_site?(site_id)
        @site_links.has_link_with_site_id?(site_id)
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
    end
  end
end
