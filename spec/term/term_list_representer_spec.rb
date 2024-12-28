# frozen_string_literal: true

require 'wikibase/model/term/term_list'
require 'wikibase/representers/term/term_list_representer'

module Wikibase
  module Representers
    module Term
      include Wikibase::DataModel::Term

      describe TermListRepresenter do
        let(:term_list) do
          TermList.new(
            terms: { 'en' => Term::Term.new(language_code: 'en', value: 'Douglas Adams') }
          )
        end
        let(:representer) { described_class.new(term_list) }
        let(:json) { '{"en":{"language":"en","value":"Douglas Adams"}}' }

        it 'serializes a term list object' do
          expect(representer.to_json).to eq(json)
        end

        it 'deserializes a term list object' do
          expect(described_class.new(TermList.new).from_json(json)).to eq(term_list)
        end
      end
    end
  end
end
