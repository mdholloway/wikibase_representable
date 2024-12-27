# frozen_string_literal: true

require 'model/term/alias_group'
require 'serializers/term/alias_group_serializer'

module Wikibase
  module Serializers
    module Term
      include Wikibase::DataModel::Term

      describe AliasGroupSerializer do
        let(:alias_group) { AliasGroup.new(language_code: 'en', aliases: ['Douglas Adams']) }
        let(:serializer) { described_class.new(alias_group) }
        let(:json) { '{"language":"en","aliases":["Douglas Adams"]}' }

        it 'serializes an alias group object' do
          expect(serializer.to_json).to eq(json)
        end

        it 'deserializes an alias group object' do
          expect(described_class.new(AliasGroup.new).from_json(json)).to eq(alias_group)
        end
      end
    end
  end
end
