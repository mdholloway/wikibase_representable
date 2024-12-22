# frozen_string_literal: true

require 'representable/json/hash'

module Wikibase
  module Serializers
    # Serializer for a hash of (siteid => sitelink)
    class SiteLinkListSerializer < Representable::Decorator
      include Representable::JSON::Hash

      values decorator: SiteLinkSerializer, class: SiteLink
    end
  end
end
