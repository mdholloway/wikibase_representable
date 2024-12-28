# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/site_link_list_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe SiteLinkListRepresenter do
      let(:site_link_list) do
        SiteLinkList.new(site_links: {
                           'enwiki' => SiteLink.new(site_id: 'enwiki',
                                                    page_name: 'Douglas_Adams',
                                                    badges: ['Q17437798']),
                           'dewiki' => SiteLink.new(site_id: 'dewiki',
                                                    page_name: 'Douglas_Adams',
                                                    badges: ['Q17437798'])
                         })
      end
      let(:representer) { described_class.new(site_link_list) }
      let(:json) do
        '{"enwiki":{"siteid":"enwiki","pagename":"Douglas_Adams","badges":["Q17437798"]},' \
          '"dewiki":{"siteid":"dewiki","pagename":"Douglas_Adams","badges":["Q17437798"]}}'
      end

      it 'serializes a sitelink list object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes a sitelink list object' do
        expect(described_class.new(SiteLinkList.new).from_json(json)).to eq(site_link_list)
      end
    end
  end
end
