# frozen_string_literal: true

require 'model/data_value/data_value'
require 'serializers/data_value/data_value_serializer'

module Wikibase
  module Serializers
    module DataValue
      include Wikibase::DataModel::DataValue

      describe DataValueSerializer do
        describe 'given a numeric data value' do
          let(:data_value) { DataValue::DataValue.new(type: 'number', value: 42) }
          let(:serializer) { described_class.new(data_value) }
          let(:json) { '{"value":42,"type":"number"}' }

          it 'serializes a data value object' do
            expect(serializer.to_json).to eq(json)
          end

          it 'deserializes a data value object' do
            expect(described_class.new(DataValue::DataValue.new).from_json(json)).to eq(data_value)
          end
        end

        describe 'given a string data value' do
          let(:data_value) { DataValue::DataValue.new(type: 'string', value: 'Douglas Adams') }
          let(:serializer) { described_class.new(data_value) }
          let(:json) { '{"value":"Douglas Adams","type":"string"}' }

          it 'serializes a data value object' do
            expect(serializer.to_json).to eq(json)
          end

          it 'deserializes a data value object' do
            expect(described_class.new(DataValue::DataValue.new).from_json(json)).to eq(data_value)
          end
        end
      end
    end
  end
end
