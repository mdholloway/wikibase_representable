# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Value object representing a link to a page on another site.
    class SiteLink
      attr_accessor :site_id, :page_name, :badges

      def initialize(site_id: nil, page_name: nil, badges: nil)
        @site_id = site_id
        @page_name = page_name
        @badges = badges
      end

      def state
        [site_id, page_name, badges]
      end

      def ==(other)
        other.class == self.class && other.state == state
      end

      def eql?(other)
        self == other
      end
    end
  end
end
