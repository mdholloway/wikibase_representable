# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/alias_group_list_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe AliasGroupListRepresenter do
      let(:alias_group_list) do
        AliasGroupList.new(
          alias_groups: {
            'en' => [Term.new(language_code: 'en', value: 'Douglas Adams')]
          }
        )
      end
      let(:representer) { described_class.new(alias_group_list) }
      let(:json) { '{"en":[{"language":"en","value":"Douglas Adams"}]}' }

      it 'serializes an alias group list object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes an alias group list object' do
        expect(described_class.new(AliasGroupList.new).from_json(json)).to eq(alias_group_list)
      end
    end
  end
end
