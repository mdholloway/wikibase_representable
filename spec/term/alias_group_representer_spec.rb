# frozen_string_literal: true

require 'wikibase/model/term/alias_group'
require 'wikibase/representers/term/alias_group_representer'

module Wikibase
  module Representers
    module Term
      describe AliasGroupRepresenter do
        let(:alias_group) { Wikibase::Model::Term::AliasGroup.new(language_code: 'en', aliases: ['Douglas Adams']) }
        let(:representer) { described_class.new(alias_group) }
        let(:json) { '{"language":"en","aliases":["Douglas Adams"]}' }

        it 'serializes an alias group object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes an alias group object' do
          expect(described_class.new(Wikibase::Model::Term::AliasGroup.new).from_json(json)).to eq(alias_group)
        end
      end
    end
  end
end
