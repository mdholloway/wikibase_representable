# frozen_string_literal: true

require 'model/term/term_list'
require 'serializers/term/term_list_serializer'

module Wikibase
  module Serializers
    module Term
      include Wikibase::DataModel::Term

      describe TermListSerializer do
        let(:term_list) do
          TermList.new(
            terms: { 'en' => Term::Term.new(language_code: 'en', value: 'Douglas Adams') }
          )
        end
        let(:serializer) { described_class.new(term_list) }
        let(:json) { '{"en":{"language":"en","value":"Douglas Adams"}}' }

        it 'serializes a term list object' do
          expect(serializer.to_json).to eq(json)
        end

        it 'deserializes a term list object' do
          expect(described_class.new(TermList.new).from_json(json)).to eq(term_list)
        end
      end
    end
  end
end
