# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/alias_group_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe AliasGroupRepresenter do
      let(:alias_group) { AliasGroup.new(language_code: 'en', aliases: ['Douglas Adams']) }
      let(:representer) { described_class.new(alias_group) }
      let(:json) { '{"language":"en","aliases":["Douglas Adams"]}' }

      it 'serializes an alias group object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes an alias group object' do
        expect(described_class.new(AliasGroup.new).from_json(json)).to eq(alias_group)
      end
    end
  end
end
