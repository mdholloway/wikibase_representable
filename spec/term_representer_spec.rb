# frozen_string_literal: true

require 'wikibase_representable/model'
require 'wikibase_representable/representers/term_representer'

module WikibaseRepresentable
  module Representers
    include WikibaseRepresentable::Model

    describe TermRepresenter do
      let(:term) { Term.new(language_code: 'en', value: 'Douglas Adams') }
      let(:representer) { described_class.new(term) }
      let(:json) { '{"language":"en","value":"Douglas Adams"}' }

      it 'serializes a term object' do
        expect(representer.to_json).to eq(json)
      end

      it 'deserializes a term object' do
        expect(described_class.new(Term.new).from_json(json)).to eq(term)
      end
    end
  end
end
