# frozen_string_literal: true

require 'model/site_link_list'
require 'model/term/alias_group_list'
require 'model/term/term_list'
require 'model/statement/statement_list'

module Wikibase
  module DataModel
    module Entity
      # Represents a single Wikibase item.
      # See https://www.mediawiki.org/wiki/Wikibase/DataModel#Items
      class Item
        include Wikibase::DataModel
        include Wikibase::DataModel::Statement
        include Wikibase::DataModel::Term

        ENTITY_TYPE = 'item'

        attr_accessor :type, :id, :labels, :descriptions, :alias_groups, :sitelinks, :statements

        def initialize(type: ENTITY_TYPE, id: nil, labels: TermList.new,
                       descriptions: TermList.new, alias_groups: AliasGroupList.new,
                       sitelinks: SiteLinkList.new, statements: StatementList.new)
          @type = type
          @id = id
          @labels = labels
          @descriptions = descriptions
          @alias_groups = alias_groups
          @sitelinks = sitelinks
          @statements = statements
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
          @labels.empty? && @descriptions.empty? && @alias_groups.empty? && @sitelinks.empty? && @statements.empty?
        end

        def ==(other)
          other.is_a?(self.class) &&
            @type == other.type &&
            @id == other.id &&
            @labels == other.labels &&
            @descriptions == other.descriptions &&
            @alias_groups == other.alias_groups &&
            @sitelinks == other.sitelinks &&
            @statements == other.statements
        end

        def eql?(other)
          self == other
        end
      end
    end
  end
end
