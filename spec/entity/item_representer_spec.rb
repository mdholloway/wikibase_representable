# frozen_string_literal: true

require 'model/entity/item'
require 'model/term/term_list'
require 'representers/entity/item_representer'

module Wikibase
  module Representers
    module Entity
      include Wikibase::DataModel::Entity
      include Wikibase::DataModel::Term

      describe ItemRepresenter do
        let(:item) do
          Item.new(id: 'Q42',
                   labels: TermList.new(terms: {
                                          'en' => Wikibase::DataModel::Term::Term.new(language_code: 'en',
                                                                                      value: 'Douglas Adams')
                                        }),
                   descriptions: TermList.new(terms: {
                                                'en' => Wikibase::DataModel::Term::Term.new(language_code: 'en',
                                                                                            value: 'writer')
                                              }))
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
          expect(described_class.new(Item.new).from_json(json)).to eq(item)
        end
      end
    end
  end
end
