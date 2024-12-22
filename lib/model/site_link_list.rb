# frozen_string_literal: true

module Wikibase
  module DataModel
    # Hash of SiteLink objects keyed by site id.
    class SiteLinkList
      def initialize(site_links: {})
        @site_links = site_links
      end

      def get_by_site_id(site_id)
        @site_links.fetch(site_id)
      end

      def link_with_site_id?(site_id)
        @site_links.key?(site_id)
      end

      def empty?
        @site_links.empty?
      end
    end
  end
end
