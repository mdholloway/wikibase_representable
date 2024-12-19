module Wikibase
  module DataModel
    class SiteLink
      attr_reader :site_id, :page_name, :badges

      def initialize(site_id:, page_name:, badges: nil)
        @site_id = site_id
        @page_name = page_name
        @badges = badges
      end
    end
  end
end
