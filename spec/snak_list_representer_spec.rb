# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/snak_list_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe SnakListRepresenter do
      let(:number_value) { DataValue.new(type: 'number', value: 42) }
      let(:number_value_snak) do
        PropertyValueSnak.new(property_id: 'P1', hash: 'abcdef', data_value: number_value)
      end
      let(:string_value) { DataValue.new(type: 'string', value: 'Douglas Adams') }
      let(:string_value_snak) do
        PropertyValueSnak.new(property_id: 'P2', hash: 'abcdef', data_value: string_value)
      end
      let(:entity_id) { EntityId.new(id: 'Q42', numeric_id: 42, entity_type: 'item') }
      let(:entity_id_value) { EntityIdValue.new(value: entity_id) }
      let(:entity_id_value_snak) do
        PropertyValueSnak.new(property_id: 'P3', hash: 'abcdef', data_value: entity_id_value)
      end
      let(:snak_list) { { 'P1' => [number_value_snak], 'P2' => [string_value_snak], 'P3' => [entity_id_value_snak] } }
      let(:representer) { described_class.new(snak_list) }
      let(:json) do
        '{"P1":[{"snaktype":"value","property":"P1","hash":"abcdef","datavalue":{"value":42,"type":"number"}}],' \
          '"P2":[{"snaktype":"value","property":"P2","hash":"abcdef","datavalue":{"value":"Douglas Adams",' \
          '"type":"string"}}],"P3":[{"snaktype":"value","property":"P3","hash":"abcdef","datavalue":{"value":' \
          '{"entity-type":"item","numeric-id":42,"id":"Q42"},"type":"wikibase-entityid"}}]}'
      end

      it 'serializes a snak list object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes a list of snaks' do
        expect(described_class.new(SnakList.new).from_json(json)).to eq(snak_list)
      end
    end
  end
end
