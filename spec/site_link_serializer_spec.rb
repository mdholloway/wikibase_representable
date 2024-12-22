# frozen_string_literal: true

require 'model/site_link'
require 'serializers/site_link_serializer'

include Wikibase::DataModel
include Wikibase::Serializers

describe SiteLinkSerializer do
  let(:site_link) { SiteLink.new(site_id: 'enwiki', page_name: 'Douglas_Adams', badges: ['Q17437798']) }
  let(:serializer) { SiteLinkSerializer.new(site_link) }
  let(:json) { '{"siteid":"enwiki","pagename":"Douglas_Adams","badges":["Q17437798"]}' }

  it 'serializes a sitelink object' do
    expect(serializer.to_json).to eq(json)
  end

  it 'deserializes a sitelink object' do
    expect(SiteLinkSerializer.new(SiteLink.new).from_json(json)).to eql(site_link)
  end
end
