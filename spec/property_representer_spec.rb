# frozen_string_literal: true

require 'spec_helper'

module WikibaseRepresentable
  module Representers
    describe PropertyRepresenter do
      let(:property) do
        Model::Property.new(id: 'P1',
                            data_type: 'string',
                            labels_hash: { 'en' => Model::Term.new(language_code: 'en', value: 'DS ID') },
                            descriptions_hash: { 'en' => Model::Term.new(language_code: 'en',
                                                                         value: 'Digital Scriptorium 2.0 identifier') })
      end
      let(:representer) { described_class.new(property) }
      let(:json) do
        <<~JSON
          {
            "type": "property",
            "datatype": "string",
            "id": "P1",
            "labels": {
              "en": {
                "language": "en",
                "value": "DS ID"
              }
            },
            "descriptions": {
              "en": {
                "language": "en",
                "value": "Digital Scriptorium 2.0 identifier"
              }
            },
            "aliases": {},
            "claims": {}
          }
        JSON
      end

      it 'serializes a property object' do
        expect(representer.to_json).to eq(JSON.parse(json).to_json)
      end

      it 'deserializes a property object' do
        expect(described_class.new(Model::Property.new).from_json(json)).to eq(property)
      end
    end
  end
end
