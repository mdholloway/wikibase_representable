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

      def ==(other)
        other.is_a?(self.class) &&
          @site_id == other.site_id &&
          @page_name == other.page_name &&
          @badges.size == other.badges.size &&
          @badges & other.badges == @badges
      end

      def eql?(other)
        self == other
      end
    end
  end
end
