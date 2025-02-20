# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/entity_id_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe EntityIdRepresenter do
      let(:entity_id) { EntityId.new(id: 'Q42', entity_type: 'item', numeric_id: 42) }
      let(:representer) { described_class.new(entity_id) }
      let(:json) { '{"entity-type":"item","numeric-id":42,"id":"Q42"}' }

      it 'serializes an entity ID value object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes an entity ID value object' do
        expect(described_class.new(EntityId.new).from_json(json)).to eq(entity_id)
      end
    end
  end
end
