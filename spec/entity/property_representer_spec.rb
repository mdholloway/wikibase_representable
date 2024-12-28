# frozen_string_literal: true

require 'wikibase/model/entity/property'
require 'wikibase/model/term/term'
require 'wikibase/model/term/term_list'
require 'wikibase/representers/entity/property_representer'

module Wikibase
  module Representers
    module Entity
      describe PropertyRepresenter do
        let(:property) do
          Wikibase::Model::Entity::Property.new(id: 'P1',
                                                data_type: 'string',
                                                labels: Wikibase::Model::Term::TermList.new(terms: { 'en' =>
                         Wikibase::Model::Term::Term.new(language_code: 'en',
                                                         value: 'DS ID') }),
                                                descriptions: Wikibase::Model::Term::TermList.new(terms: { 'en' =>
                         Wikibase::Model::Term::Term.new(language_code: 'en',
                                                         value: 'Digital Scriptorium 2.0 identifier') }))
        end
        let(:representer) { described_class.new(property) }
        let(:json) do
          '{"type":"property","datatype":"string","id":"P1","labels":' \
            '{"en":{"language":"en","value":"DS ID"}},"descriptions":' \
            '{"en":{"language":"en","value":"Digital Scriptorium 2.0 identifier"}},' \
            '"aliases":{},"claims":{}}'
        end

        it 'serializes a property object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a property object' do
          expect(described_class.new(Wikibase::Model::Entity::Property.new).from_json(json)).to eq(property)
        end
      end
    end
  end
end
