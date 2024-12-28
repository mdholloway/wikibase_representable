# frozen_string_literal: true

require 'wikibase/model/data_value/data_value'
require 'wikibase/model/entity/entity_id'
require 'wikibase/model/entity/entity_id_value'
require 'wikibase/model/snak/property_value_snak'
require 'wikibase/representers/snak/snak_list_representer'

module Wikibase
  module Representers
    module Snak
      describe SnakListRepresenter do
        let(:number_value) { Wikibase::Model::DataValue::DataValue.new(type: 'number', value: 42) }
        let(:number_value_snak) do
          Wikibase::Model::Snak::PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: number_value)
        end
        let(:string_value) { Wikibase::Model::DataValue::DataValue.new(type: 'string', value: 'Douglas Adams') }
        let(:string_value_snak) do
          Wikibase::Model::Snak::PropertyValueSnak.new(property_id: 'P2', hash: 'abcdef', data_value: string_value)
        end
        let(:entity_id) { Wikibase::Model::Entity::EntityId.new(id: 'Q42', numeric_id: 42, entity_type: 'item') }
        let(:entity_id_value) { Wikibase::Model::Entity::EntityIdValue.new(value: entity_id) }
        let(:entity_id_value_snak) do
          Wikibase::Model::Snak::PropertyValueSnak.new(property_id: 'P3', hash: 'abcdef', data_value: entity_id_value)
        end
        let(:snaks) { { 'P1' => number_value_snak, 'P2' => string_value_snak, 'P3' => entity_id_value_snak } }
        let(:snak_list) { Wikibase::Model::Snak::SnakList.new(snaks: snaks) }
        let(:representer) { described_class.new(snak_list) }
        let(:json) do
          '{"P1":{"snaktype":"value","property":"P1","hash":"abcdef","datavalue":{"value":42,"type":"number"}},' \
            '"P2":{"snaktype":"value","property":"P2","hash":"abcdef","datavalue":{"value":"Douglas Adams",' \
            '"type":"string"}},"P3":{"snaktype":"value","property":"P3","hash":"abcdef","datavalue":{"value":' \
            '{"entity-type":"item","numeric-id":42,"id":"Q42"},"type":"wikibase-entityid"}}}'
        end

        it 'serializes a snak list object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a list of snaks' do
          expect(described_class.new(Wikibase::Model::Snak::SnakList.new).from_json(json)).to eq(snak_list)
        end
      end
    end
  end
end
