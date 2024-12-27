# frozen_string_literal: true

require 'model/term/alias_group_list'
require 'representers/term/alias_group_list_representer'

module Wikibase
  module Representers
    module Term
      include Wikibase::DataModel::Term

      describe AliasGroupListRepresenter do
        let(:alias_group_list) do
          AliasGroupList.new(
            alias_groups: {
              'en' => AliasGroup.new(language_code: 'en', aliases: ['Douglas Adams'])
            }
          )
        end
        let(:representer) { described_class.new(alias_group_list) }
        let(:json) { '{"en":{"language":"en","aliases":["Douglas Adams"]}}' }

        it 'serializes an alias group list object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes an alias group list object' do
          expect(described_class.new(AliasGroupList.new).from_json(json)).to eq(alias_group_list)
        end
      end
    end
  end
end
