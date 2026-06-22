# frozen_string_literal: true

require 'representable/json/hash'
require 'wikibase_representable/model'
require 'wikibase_representable/representers/site_link_representer'

module WikibaseRepresentable
  module Representers
    # Representer for a hash of (siteid => sitelink)
    class SiteLinkHashRepresenter < Representable::Decorator
      include Representable::JSON::Hash

      values decorator: SiteLinkRepresenter, class: Model::SiteLink
    end
  end
end
