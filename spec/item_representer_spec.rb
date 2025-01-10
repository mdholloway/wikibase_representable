# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/item_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe ItemRepresenter do
      let(:labels) do
        { 'en' => Term.new(language_code: 'en', value: 'Douglas Adams') }
      end
      let(:descriptions) do
        { 'en' => Term.new(language_code: 'en', value: 'writer') }
      end
      let(:item) do
        Item.new(id: 'Q42',
                 labels: labels,
                 descriptions: descriptions)
      end
      let(:representer) { described_class.new(item) }
      let(:json) do
        <<~JSON
          {
            "type": "item",
            "id": "Q42",
            "labels": {
              "en": {
                "language": "en",
                "value": "Douglas Adams"
              }
            },
            "descriptions": {
              "en": {
                "language": "en",
                "value": "writer"
              }
            },
            "aliases": {},
            "claims": {},
            "sitelinks": {}
          }
        JSON
      end

      it 'serializes an item object' do
        expect(representer.to_json).to eq(JSON.parse(json).to_json)
      end

      it 'deserializes an item object' do
        expect(described_class.new(Item.new).from_json(json)).to eq(item)
      end
    end
  end
end
