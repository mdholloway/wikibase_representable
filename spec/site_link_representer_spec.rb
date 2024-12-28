# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/site_link_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe SiteLinkRepresenter do
      let(:site_link) do
        SiteLink.new(site_id: 'enwiki', page_name: 'Douglas_Adams', badges: ['Q17437798'])
      end
      let(:representer) { described_class.new(site_link) }
      let(:json) { '{"siteid":"enwiki","pagename":"Douglas_Adams","badges":["Q17437798"]}' }

      it 'serializes a sitelink object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes a sitelink object' do
        expect(described_class.new(SiteLink.new).from_json(json)).to eq(site_link)
      end
    end
  end
end
