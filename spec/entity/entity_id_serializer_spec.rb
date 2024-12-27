# frozen_string_literal: true

require 'model/entity/entity_id'
require 'serializers/entity/entity_id_serializer'

module Wikibase
  module Serializers
    module Entity
      include Wikibase::DataModel::Entity

      describe EntityIdSerializer do
        let(:entity_id) { EntityId.new(id: 'Q42', entity_type: 'item', numeric_id: 42) }
        let(:serializer) { described_class.new(entity_id) }
        let(:json) { '{"entity-type":"item","numeric-id":42,"id":"Q42"}' }

        it 'serializes an entity ID value object' do
          expect(serializer.to_json).to eq(json)
        end

        it 'deserializes an entity ID value object' do
          expect(described_class.new(EntityId.new).from_json(json)).to eq(entity_id)
        end
      end
    end
  end
end
