# frozen_string_literal: true

require 'wikibase/model/entity/entity_id'
require 'wikibase/model/entity/entity_id_value'
require 'wikibase/representers/entity/entity_id_value_representer'

module Wikibase
  module Representers
    module Entity
      describe EntityIdValueRepresenter do
        let(:entity_id) { Wikibase::Model::Entity::EntityId.new(id: 'Q42', entity_type: 'item', numeric_id: 42) }
        let(:entity_id_value) { Wikibase::Model::Entity::EntityIdValue.new(value: entity_id) }
        let(:representer) { described_class.new(entity_id_value) }
        let(:json) { '{"value":{"entity-type":"item","numeric-id":42,"id":"Q42"},"type":"wikibase-entityid"}' }

        it 'serializes an entity ID value object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes an entity ID value object' do
          expect(described_class.new(Wikibase::Model::Entity::EntityIdValue.new).from_json(json)).to eq(entity_id_value)
        end
      end
    end
  end
end
