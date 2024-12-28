# frozen_string_literal: true

require 'representable/json'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/alias_group_list_representer'
require 'wikibase_representable/representers/site_link_list_representer'
require 'wikibase_representable/representers/statement_list_representer'
require 'wikibase_representable/representers/term_list_representer'

module WikibaseRepresentable
  module Representers
    # Representer for Wikibase items
    class ItemRepresenter < Representable::Decorator
      include Representable::JSON
      include WikibaseRepresentable::Model

      property :type
      property :id
      property :labels, decorator: TermListRepresenter,
                        class: TermList
      property :descriptions, decorator: TermListRepresenter,
                              class: TermList
      property :alias_groups, as: 'aliases',
                              decorator: AliasGroupListRepresenter,
                              class: AliasGroupList
      property :statements, as: 'claims',
                            decorator: StatementListRepresenter,
                            class: StatementList
      property :site_links, as: 'sitelinks',
                            decorator: SiteLinkListRepresenter,
                            class: SiteLinkList
    end
  end
end
