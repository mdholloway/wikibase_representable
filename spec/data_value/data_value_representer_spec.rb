# frozen_string_literal: true

require 'wikibase/model/data_value/data_value'
require 'wikibase/representers/data_value/data_value_representer'

module Wikibase
  module Representers
    module DataValue
      describe DataValueRepresenter do
        describe 'given a numeric data value' do
          let(:data_value) { Wikibase::Model::DataValue::DataValue.new(type: 'number', value: 42) }
          let(:representer) { described_class.new(data_value) }
          let(:json) { '{"value":42,"type":"number"}' }

          it 'serializes a data value object' do
            expect(representer.to_json).to eq(json)
          end

          it 'deserializes a data value object' do
            expect(described_class.new(Wikibase::Model::DataValue::DataValue.new).from_json(json)).to eq(data_value)
          end
        end

        describe 'given a string data value' do
          let(:data_value) { Wikibase::Model::DataValue::DataValue.new(type: 'string', value: 'Douglas Adams') }
          let(:representer) { described_class.new(data_value) }
          let(:json) { '{"value":"Douglas Adams","type":"string"}' }

          it 'serializes a data value object' do
            expect(representer.to_json).to eq(json)
          end

          it 'deserializes a data value object' do
            expect(described_class.new(Wikibase::Model::DataValue::DataValue.new).from_json(json)).to eq(data_value)
          end
        end
      end
    end
  end
end
