# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/property_value_snak_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe PropertyValueSnakRepresenter do
      describe 'given a numeric data value' do
        let(:data_value) { DataValue.new(type: 'number', value: 42) }
        let(:snak) do
          PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: data_value)
        end
        let(:representer) { described_class.new(snak) }
        let(:json) { '{"snaktype":"value","property":"P1","hash":"abcdef","datavalue":{"value":42,"type":"number"}}' }

        it 'serializes a property value snak object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a property value snak object' do
          expect(described_class.new(PropertyValueSnak.new).from_json(json)).to eq(snak)
        end
      end

      describe 'given a string data value' do
        let(:data_value) { DataValue.new(type: 'string', value: 'Douglas Adams') }
        let(:snak) do
          PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: data_value)
        end
        let(:representer) { described_class.new(snak) }
        let(:json) do
          '{"snaktype":"value","property":"P1","hash":"abcdef","datavalue":{"value":"Douglas Adams","type":"string"}}'
        end

        it 'serializes a property value snak object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a property value snak object' do
          expect(described_class.new(PropertyValueSnak.new).from_json(json)).to eq(snak)
        end
      end

      describe 'given a time value' do
        let(:time) do
          Time.new(time: '+1971-03-11T00:00:00Z',
                   time_zone: 0,
                   before: 0,
                   after: 0,
                   precision: 11,
                   calendar_model: 'http://www.wikidata.org/entity/Q1985727')
        end
        let(:data_value) { TimeValue.new(value: time) }
        let(:snak) do
          PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: data_value)
        end
        let(:representer) { described_class.new(snak) }
        let(:json) do
          '{"snaktype":"value","property":"P1","hash":"abcdef","datavalue":{"value":' \
            '{"time":"+1971-03-11T00:00:00Z","timezone":0,"before":0,"after":0,"precision":11,' \
            '"calendarmodel":"http://www.wikidata.org/entity/Q1985727"},"type":"time"}}'
        end

        it 'serializes a property value snak object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a property value snak object' do
          expect(described_class.new(PropertyValueSnak.new).from_json(json)).to eq(snak)
        end
      end

      describe 'given an entity ID value' do
        let(:entity_id) { EntityId.new(id: 'Q42', numeric_id: 42, entity_type: 'item') }
        let(:data_value) { EntityIdValue.new(value: entity_id) }
        let(:snak) do
          PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: data_value)
        end
        let(:representer) { described_class.new(snak) }
        let(:json) do
          '{"snaktype":"value","property":"P1","hash":"abcdef","datavalue":{"value":' \
            '{"entity-type":"item","numeric-id":42,"id":"Q42"},"type":"wikibase-entityid"}}'
        end

        it 'serializes a property value snak object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a property value snak object' do
          expect(described_class.new(PropertyValueSnak.new).from_json(json)).to eq(snak)
        end
      end
    end
  end
end
