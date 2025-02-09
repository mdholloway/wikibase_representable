# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/alias_group_hash_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe AliasGroupHashRepresenter do
      let(:alias_group_hash) do
        { 'en' => [Term.new(language_code: 'en', value: 'Douglas Adams')] }
      end
      let(:representer) { described_class.new(alias_group_hash) }
      let(:json) { '{"en":[{"language":"en","value":"Douglas Adams"}]}' }

      it 'serializes an alias group list object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes an alias group list object' do
        expect(described_class.new(AliasGroupHash.new).from_json(json)).to eq(alias_group_hash)
      end
    end
  end
end
