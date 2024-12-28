# frozen_string_literal: true

require 'wikibase/model/entity/item'
require 'wikibase/model/term/term'
require 'wikibase/model/term/term_list'
require 'wikibase/representers/entity/item_representer'

module Wikibase
  module Representers
    module Entity
      describe ItemRepresenter do
        let(:labels) do
          Wikibase::Model::Term::TermList.new(terms: {
                                                'en' => Wikibase::Model::Term::Term.new(language_code: 'en',
                                                                                        value: 'Douglas Adams')
                                              })
        end
        let(:descriptions) do
          Wikibase::Model::Term::TermList.new(terms: {
                                                'en' => Wikibase::Model::Term::Term.new(language_code: 'en',
                                                                                        value: 'writer')
                                              })
        end
        let(:item) do
          Wikibase::Model::Entity::Item.new(id: 'Q42',
                                            labels: labels,
                                            descriptions: descriptions)
        end
        let(:representer) { described_class.new(item) }
        let(:json) do
          '{"type":"item","id":"Q42","labels":{"en":{"language":"en","value":"Douglas Adams"}},' \
            '"descriptions":{"en":{"language":"en","value":"writer"}},"aliases":{},"claims":{},"sitelinks":{}}'
        end

        it 'serializes an item object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes an item object' do
          expect(described_class.new(Wikibase::Model::Entity::Item.new).from_json(json)).to eq(item)
        end
      end
    end
  end
end
