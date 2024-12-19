module Wikibase
  module DataModel
    class SiteLinkList
      def initialize(site_links: {})
        @site_links = site_links
      end

      def get_by_site_id(site_id)
        @site_links.fetch(site_id)
      end

      def has_link_with_site_id(site_id)
        @site_links.has_key?(site_id)
      end

      def empty?
        @site_links.empty?
      end
    end
  end
end