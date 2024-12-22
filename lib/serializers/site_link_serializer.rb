# frozen_string_literal: true

require 'representable/json'

module Wikibase
  module Serializers
    # Serializer for sitelink objects
    class SiteLinkSerializer < Representable::Decorator
      include Representable::JSON

      property :site_id, as: 'siteid'
      property :page_name, as: 'pagename'
      collection :badges
    end
  end
end
