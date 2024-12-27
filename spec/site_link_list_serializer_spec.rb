# frozen_string_literal: true

require 'model/site_link_list'
require 'serializers/site_link_list_serializer'

module Wikibase
  module Serializers
    include Wikibase::DataModel

    describe SiteLinkListSerializer do
      let(:site_link_list) do
        SiteLinkList.new(site_links: {
                           'enwiki' => SiteLink.new(site_id: 'enwiki', page_name: 'Douglas_Adams',
                                                    badges: ['Q17437798']),
                           'dewiki' => SiteLink.new(site_id: 'dewiki', page_name: 'Douglas_Adams',
                                                    badges: ['Q17437798'])
                         })
      end
      let(:serializer) { described_class.new(site_link_list) }
      let(:json) do
        '{"enwiki":{"siteid":"enwiki","pagename":"Douglas_Adams","badges":["Q17437798"]},' \
          '"dewiki":{"siteid":"dewiki","pagename":"Douglas_Adams","badges":["Q17437798"]}}'
      end

      it 'serializes a sitelink list object' do
        expect(serializer.to_json).to eq(json)
      end

      it 'deserializes a sitelink list object' do
        expect(described_class.new(SiteLinkList.new).from_json(json)).to eq(site_link_list)
      end
    end
  end
end
