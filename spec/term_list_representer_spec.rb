# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/term_list_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe TermListRepresenter do
      let(:term_list) do
        { 'en' => Term.new(language_code: 'en', value: 'Douglas Adams') }
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
