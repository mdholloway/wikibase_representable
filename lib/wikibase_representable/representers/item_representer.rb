# frozen_string_literal: true

require 'representable/json'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/alias_group_hash_representer'
require 'wikibase_representable/representers/site_link_hash_representer'
require 'wikibase_representable/representers/statement_hash_representer'
require 'wikibase_representable/representers/term_hash_representer'

module WikibaseRepresentable
  module Representers
    # Representer for Wikibase items
    class ItemRepresenter < Representable::Decorator
      include Representable::JSON
      include WikibaseRepresentable::Model

      property :type
      property :id
      property :labels_hash, decorator: TermHashRepresenter,
                             class: TermHash
      property :descriptions_hash, decorator: TermHashRepresenter,
                                   class: TermHash
      property :alias_groups_hash, as: 'aliases_hash',
                                   decorator: AliasGroupHashRepresenter,
                                   class: AliasGroupHash
      property :statements_hash, as: 'claims_hash',
                                 decorator: StatementHashRepresenter,
                                 class: StatementHash
      property :site_links_hash, decorator: SiteLinkHashRepresenter,
                                 class: SiteLinkHash
    end
  end
end
