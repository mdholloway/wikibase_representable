# frozen_string_literal: true

require 'model/site_link'
require 'representable/json/hash'
require 'serializers/site_link_serializer'

module Wikibase
  module Serializers
    # Serializer for a hash of (siteid => sitelink)
    class SiteLinkListSerializer < Representable::Decorator
      include Representable::JSON::Hash
      include Wikibase::DataModel

      values decorator: SiteLinkSerializer, class: SiteLink
    end
  end
end
