# frozen_string_literal: true

module Wikibase
  module DataModel
    # Immutable value object representing a link to a page on another site.
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
