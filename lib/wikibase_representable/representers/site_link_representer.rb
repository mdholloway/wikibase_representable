# frozen_string_literal: true

require 'representable/json'

module WikibaseRepresentable
  module Representers
    # Representer for sitelink objects
    class SiteLinkRepresenter < Representable::Decorator
      include Representable::JSON

      property :site_id, as: 'siteid'
      property :page_name, as: 'pagename'
      collection :badges
    end
  end
end
