# frozen_string_literal: true

require 'model/term/alias_group_list'
require 'serializers/term/alias_group_list_serializer'

module Wikibase
  module Serializers
    module Term
      include Wikibase::DataModel::Term

      describe AliasGroupListSerializer do
        let(:alias_group_list) do
          AliasGroupList.new(
            alias_groups: {
              'en' => AliasGroup.new(language_code: 'en', aliases: ['Douglas Adams'])
            }
          )
        end
        let(:serializer) { described_class.new(alias_group_list) }
        let(:json) { '{"en":{"language":"en","aliases":["Douglas Adams"]}}' }

        it 'serializes an alias group list object' do
          expect(serializer.to_json).to eq(json)
        end

        it 'deserializes an alias group list object' do
          expect(described_class.new(AliasGroupList.new).from_json(json)).to eq(alias_group_list)
        end
      end
    end
  end
end
