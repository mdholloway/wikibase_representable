# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase/model/site_link'
require 'wikibase/representers/site_link_representer'

module Wikibase
  module Representers
    # Representer for a hash of (siteid => sitelink)
    class SiteLinkListRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      values decorator: SiteLinkRepresenter, class: Wikibase::Model::SiteLink
    end
  end
end
