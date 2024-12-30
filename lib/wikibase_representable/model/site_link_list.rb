# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Hash of SiteLink objects keyed by site id.
    class SiteLinkList
      attr_accessor :site_links

      def initialize(site_links: {})
        @site_links = site_links
      end

      def get_by_site_id(site_id)
        @site_links[site_id]
      end

      def link_with_site_id?(site_id)
        @site_links.key?(site_id)
      end

      def each(&)
        @site_links.each(&)
      end

      def replace(site_links)
        SiteLinkList.new(site_links: site_links)
      end

      def ==(other)
        other.is_a?(self.class) &&
          @site_links == other.site_links
      end

      def eql?(other)
        self == other
      end

      def empty?
        @site_links.empty?
      end
    end
  end
end
