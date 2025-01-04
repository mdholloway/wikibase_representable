# frozen_string_literal: true

module WikibaseRepresentable
  module Model
    # Hash of SiteLink objects keyed by site id.
    class SiteLinkList < Hash
      def link_for_site(site_id)
        site_id
      end

      def link_for_site?(site_id)
        key?(site_id)
      end
    end
  end
end
