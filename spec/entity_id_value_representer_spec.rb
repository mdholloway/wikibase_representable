# frozen_string_literal: true

require 'wikibase_representable/model/entity_id'
require 'wikibase_representable/model/entity_id_value'
require 'wikibase_representable/representers/entity_id_value_representer'

module WikibaseRepresentable
  module Representers
    describe EntityIdValueRepresenter do
      let(:entity_id) { EntityId.new(id: 'Q42', entity_type: 'item', numeric_id: 42) }
      let(:entity_id_value) { EntityIdValue.new(value: entity_id) }
      let(:representer) { described_class.new(entity_id_value) }
      let(:json) { '{"value":{"entity-type":"item","numeric-id":42,"id":"Q42"},"type":"wikibase-entityid"}' }

      it 'serializes an entity ID value object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes an entity ID value object' do
        expect(described_class.new(EntityIdValue.new).from_json(json)).to eq(entity_id_value)
      end
    end
  end
end
