# frozen_string_literal: true

require 'model/term/alias_group'
require 'representers/term/alias_group_representer'

module Wikibase
  module Representers
    module Term
      include Wikibase::DataModel::Term

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
end
