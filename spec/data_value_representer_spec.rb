# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/data_value_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe DataValueRepresenter do
      describe 'given a numeric data value' do
        let(:data_value) { DataValue.new(type: 'number', value: 42) }
        let(:representer) { described_class.new(data_value) }
        let(:json) { '{"value":42,"type":"number"}' }

        it 'serializes a data value object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a data value object' do
          expect(described_class.new(DataValue.new).from_json(json)).to eq(data_value)
        end
      end

      describe 'given a string data value' do
        let(:data_value) { DataValue.new(type: 'string', value: 'Douglas Adams') }
        let(:representer) { described_class.new(data_value) }
        let(:json) { '{"value":"Douglas Adams","type":"string"}' }

        it 'serializes a data value object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a data value object' do
          expect(described_class.new(DataValue.new).from_json(json)).to eq(data_value)
        end
      end
    end
  end
end
