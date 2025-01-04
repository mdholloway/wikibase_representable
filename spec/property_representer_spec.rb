# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/property_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe PropertyRepresenter do
      let(:property) do
        Property.new(id: 'P1',
                     data_type: 'string',
                     labels: { 'en' => Term.new(language_code: 'en', value: 'DS ID') },
                     descriptions: { 'en' => Term.new(language_code: 'en',
                                                      value: 'Digital Scriptorium 2.0 identifier') })
      end
      let(:representer) { described_class.new(property) }
      let(:json) do
        '{"type":"property","datatype":"string","id":"P1","labels":' \
          '{"en":{"language":"en","value":"DS ID"}},"descriptions":' \
          '{"en":{"language":"en","value":"Digital Scriptorium 2.0 identifier"}},' \
          '"aliases":{},"claims":{}}'
      end

      it 'serializes a property object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes a property object' do
        expect(described_class.new(Property.new).from_json(json)).to eq(property)
      end
    end
  end
end
