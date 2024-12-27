# frozen_string_literal: true

require 'model/site_link'
require 'representable/json/hash'
require 'representers/site_link_representer'

module Wikibase
  module Representers
    # Representer for a hash of (siteid => sitelink)
    class SiteLinkListRepresenter < Representable::Decorator
      include Representable::JSON::Hash
      include Wikibase::DataModel

      values decorator: SiteLinkRepresenter, class: SiteLink
    end
  end
end
