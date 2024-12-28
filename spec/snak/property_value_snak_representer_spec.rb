# frozen_string_literal: true

require 'wikibase/model/data_value/data_value'
require 'wikibase/model/entity/entity_id'
require 'wikibase/model/entity/entity_id_value'
require 'wikibase/model/snak/property_value_snak'
require 'wikibase/representers/snak/property_value_snak_representer'

module Wikibase
  module Representers
    module Snak
      describe PropertyValueSnakRepresenter do
        describe 'given a numeric data value' do
          let(:data_value) { Wikibase::Model::DataValue::DataValue.new(type: 'number', value: 42) }
          let(:snak) do
            Wikibase::Model::Snak::PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: data_value)
          end
          let(:representer) { described_class.new(snak) }
          let(:json) { '{"snaktype":"value","property":"P1","hash":"abcdef","datavalue":{"value":42,"type":"number"}}' }

          it 'serializes a property value snak object' do
            expect(representer.to_json).to eq(json)
          end

          it 'deserializes a property value snak object' do
            expect(described_class.new(Wikibase::Model::Snak::PropertyValueSnak.new).from_json(json)).to eq(snak)
          end
        end

        describe 'given a string data value' do
          let(:data_value) { Wikibase::Model::DataValue::DataValue.new(type: 'string', value: 'Douglas Adams') }
          let(:snak) do
            Wikibase::Model::Snak::PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: data_value)
          end
          let(:representer) { described_class.new(snak) }
          let(:json) do
            '{"snaktype":"value","property":"P1","hash":"abcdef","datavalue":{"value":"Douglas Adams","type":"string"}}'
          end

          it 'serializes a property value snak object' do
            expect(representer.to_json).to eq(json)
          end

          it 'deserializes a property value snak object' do
            expect(described_class.new(Wikibase::Model::Snak::PropertyValueSnak.new).from_json(json)).to eq(snak)
          end
        end

        describe 'given an entity ID value' do
          let(:entity_id) { Wikibase::Model::Entity::EntityId.new(id: 'Q42', numeric_id: 42, entity_type: 'item') }
          let(:data_value) { Wikibase::Model::Entity::EntityIdValue.new(value: entity_id) }
          let(:snak) do
            Wikibase::Model::Snak::PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: data_value)
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
            expect(described_class.new(Wikibase::Model::Snak::PropertyValueSnak.new).from_json(json)).to eq(snak)
          end
        end
      end
    end
  end
end
